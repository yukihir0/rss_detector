require "rss_detector/version"
require 'nokogiri'

class RSSDetector 
    # xpath for feed
    RSS_XPATH  = '//link[@rel="alternate"][@type="application/rss+xml"]'
    ATOM_XPATH = '//link[@rel="alternate"][@type="application/atom+xml"]'
    
    public
    def RSSDetector::detect(doc)

        # create html from string
        html = Nokogiri::HTML(doc)

        # detect rss and atom
        @rss_feeds  = detectFeed(html, RSS_XPATH)
        @atom_feeds = detectFeed(html, ATOM_XPATH)

        return @rss_feeds + @atom_feeds
    end

    private
    def RSSDetector::detectFeed(html, feed_xpath)
        
        # feed list
        @feeds = Array.new

        # discover feed
        html.xpath(feed_xpath).each do |link|

            # get feed title and url
            @feed_title = link.attribute("title")
            @feed_url   = link.attribute("href")

            # push hash to array
            @feeds << {title: @feed_title, url: @feed_url}
        end

        return @feeds
    end
end  
