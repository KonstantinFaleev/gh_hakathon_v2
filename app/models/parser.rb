class Parser < ApplicationRecord

  require 'open-uri'

  url = 'http://www.cubecinema.com/programme'
  html = open(url)

  require 'nokogiri'

  doc = Nokogiri::HTML(html)

  showings = doc.css('.showing').map do |showing|
    showing_id = showing['id'].split('_').last.to_i

    tags = showing.css('.tags a')
               .map{|tag| tag.text.strip}

    title_el = showing.at_css('h1 a')
                   .children
                   .delete_if{|c| c.name == 'span'}

    title = title_el.text.strip

    dates = showing.at_css('.start_and_pricing')
                .inner_html
                .strip
                .split('<br>')
                .map(&:strip)
                .map{|d| DateTime.parse(d)}

    description = showing.at_css('.copy')
                      .text
                      .delete('[more...]')
                      .strip

    {id:          showing_id,
     title:       title,
     tags:        tags,
     dates:       dates,
     description: description}
  end

  require 'json'

  puts JSON.pretty_generate(showings)
end
