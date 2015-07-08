# coding: utf-8
require 'rubygems'
require 'open-uri'
require 'rss_detector'

def get_html(url)
  html = nil

  begin
    html = open(url).read
  rescue OpenURI::HTTPError => ex
    if ex.io.status[0] == '304'
      warn ex.message
    else
      raise ex
    end
  end

  return html
end

def print_feed(url, feeds)
  header = "---------- #{url} ----------"
  footer = '-' * header.length + "\n\n"

  puts header
  feeds.each { |feed| puts "#{feed[:title]} : #{feed[:url]}" }
  puts footer
end


# main
url  = 'http://d.hatena.ne.jp/yukihir0/'
html = get_html(url)
feed = RSSDetector::detect(html)
print_feed(url, feed)
