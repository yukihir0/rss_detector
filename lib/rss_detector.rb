# coding: utf-8
require "rss_detector/version"
require 'nokogiri'

module RSSDetector 
  # xpath for feed
  RSS_XPATH  = '//link[@rel="alternate"][@type="application/rss+xml"]'
  ATOM_XPATH = '//link[@rel="alternate"][@type="application/atom+xml"]'

  class << self
    public
    def detect(doc)
      # create html from string
      html = Nokogiri::HTML(doc)

      # detect rss and atom
      rss_feeds  = detectFeed(html, RSS_XPATH)
      atom_feeds = detectFeed(html, ATOM_XPATH)

      rss_feeds + atom_feeds
    end

    private
    def detectFeed(html, feed_xpath)
      # discover feed
      html.xpath(feed_xpath).inject(Array.new) do |feeds, link|

        # get feed title and url
        feed_title = link.attribute("title")
        feed_url   = link.attribute("href")

        # push hash to array
        feeds << {title: feed_title, url: feed_url}
        feeds
      end
    end
  end
end  
