require 'open-uri'
class ParsersController < ApplicationController
  def index
    @parsers = Parser.all.includes(:parser_records)
    @record_limit = 20
    Parser.paginate(page: params[:page], per_page: 10)
  end

  def show
    @parser = Parser.find(params[:parser_id])
    @record_limit = 20
    render 'show'
    respond_to do |format|
      format.js
    end
  end

  def get_parser(parser, limit)
    p 'start get parser'
    p parser.name
    doc = Nokogiri::HTML(open(parser.main_url))
    records = doc.css("#{parser.record_list_tag} #{parser.record_tag}")
    records = records[0...limit]
    records.each do |e|
      link = e.at_css('a')['href']
      if !(link =~ /^http/)
        link = URI.join(main_url, link).to_s
      end

      img = e.at_css(parser.img_tag)
      img_src = img ? img[parser.img_attr] : nil
      recorddoc = Nokogiri::HTML(open(link))
      inside_tags = recorddoc.css("#{parser.content_tag} > p, #{parser.content_tag} > h1, #{parser.content_tag} > h2, #{parser.content_tag} > h3, #{parser.content_tag} > h4,   #{parser.content_tag} > h5, #{parser.content_tag} > h6, #{parser.content_tag} > span")
      inside_content = ''
      inside_tags.each do |tag|
        tag_text = tag.inside_text.strip
        unless tag_text.empty?
          inside_content += tag_text unless tag_text.empty?
          inside_content += "\n" unless tag.name === 'span'
        end
      end

      header = recorddoc.at_css(parser.header_tag).xpath('text()').text.strip
      p header
      parser.parser_records.create({
                                   link: link,
                                   header: header,
                                   content: inside_content,
                                   img: img_src
                               })
    end
  end
end
