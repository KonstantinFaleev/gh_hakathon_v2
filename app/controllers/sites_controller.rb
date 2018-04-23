class SitesController < ApplicationController
  require 'open-uri'

  def index
    @sites = Site.all.includes(:site_entries)
    @entry_limit = 20
  end

  def show
    @site = Site.find(params[:site_id])
    @entry_limit = 20
    render 'show'
    respond_to do |format|
      format.js
    end
  end

  def refresh
    head :ok
    Site.all.each { |site| self.fetch_website(site, 20) }
    respond_to do |format|
      format.js
    end
  end

  def fetch_website(site, limit)
    p 'start fetch website'
    p site.name
    doc = Nokogiri::HTML(open(site.main_url))
    entries = doc.css("#{site.entry_list_tag} #{site.entry_tag}")
    entries = entries[0...limit]
    entries.each do |e|
      link = e.at_css('a')['href']
      if !(link =~ /^http/)
        link = URI.join(main_url, link).to_s
      end
      img = e.at_css(site.img_tag)
      img_src = img ? img[site.img_attr] : nil
      entrydoc = Nokogiri::HTML(open(link))
      inner_tags = entrydoc.css("#{site.content_tag} > p,
      #{site.content_tag} > h1, #{site.content_tag} > h2,
      #{site.content_tag} > h3, #{site.content_tag} > h4,
      #{site.content_tag} > h5, #{site.content_tag} > h6,
      #{site.content_tag} > span")
      inner_content = ''
      inner_tags.each do |tag|
        tag_text = tag.inner_text.strip
        unless tag_text.empty?
          inner_content += tag_text unless tag_text.empty?
          inner_content += "\n" unless tag.name === 'span'
        end
      end
      header = entrydoc.at_css(site.header_tag).xpath('text()').text.strip
      p header
      site.site_entries.create({
                                   link: link,
                                   header: header,
                                   content: inner_content,
                                   img: img_src
                               })
    end
  end
end