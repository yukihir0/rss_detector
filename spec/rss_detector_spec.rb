# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RSSDetector do
    context 'init' do
        describe '#detect' do
            context 'nil input' do
                it 'no feed' do
                    feeds = RSSDetector::detect(nil)
                    feeds.size.should == 0
                end
            end

            context 'null string input' do
                it 'no feed' do
                    feeds = RSSDetector::detect('')
                    feeds.size.should == 0
                end
            end

            context 'no contain feed input' do
                it 'no feed' do
                    input = <<-EOS
                        <html><head>
                        </head></html>
                    EOS

                    @feeds = RSSDetector::detect(input)
                    @feeds.size.should == 0
                end
            end

            context 'contain 1 rss feed input' do
                it '1 rss feed' do
                    input = <<-EOS
                        <html><head>
                            <link rel="alternate" type="application/rss+xml" title="test_rss_feed_title" href="http://test_rss_feed_url/"/>
                        </head></html>
                    EOS

                    feeds = RSSDetector::detect(input)
                    feeds.length.should == 1
                    feeds[0][:title].to_s.should == 'test_rss_feed_title'
                    feeds[0][:url].to_s.should   == 'http://test_rss_feed_url/'
                end
            end

            context 'contain 2 rss feed input' do
                it '2 rss feed' do
                    input = <<-EOS
                        <html><head>
                            <link rel="alternate" type="application/rss+xml" title="test_rss_feed_title_1" href="http://test_rss_feed_url_1/"/>
                            <link rel="alternate" type="application/rss+xml" title="test_rss_feed_title_2" href="http://test_rss_feed_url_2/"/>
                        </head></html>
                    EOS

                    feeds = RSSDetector::detect(input)
                    feeds.length.should == 2 
                    feeds[0][:title].to_s.should == 'test_rss_feed_title_1'
                    feeds[0][:url].to_s.should   == 'http://test_rss_feed_url_1/'
                    feeds[1][:title].to_s.should == 'test_rss_feed_title_2'
                    feeds[1][:url].to_s.should   == 'http://test_rss_feed_url_2/'
                end
            end

            context 'contain 1 atom feed input' do
                it '1 atom feed' do
                    input = <<-EOS
                        <html><head>
                            <link rel="alternate" type="application/atom+xml" title="test_atom_feed_title" href="http://test_atom_feed_url/"/>
                        </head></html>
                    EOS

                    feeds = RSSDetector::detect(input)
                    feeds.length.should == 1
                    feeds[0][:title].to_s.should == 'test_atom_feed_title'
                    feeds[0][:url].to_s.should   == 'http://test_atom_feed_url/'
                end
            end

            context 'contain 2 atom feed input' do
                it '2 atom feed' do
                    input = <<-EOS
                        <html><head>
                            <link rel="alternate" type="application/atom+xml" title="test_atom_feed_title_1" href="http://test_atom_feed_url_1/"/>
                            <link rel="alternate" type="application/atom+xml" title="test_atom_feed_title_2" href="http://test_atom_feed_url_2/"/>
                        </head></html>
                    EOS

                    feeds = RSSDetector::detect(input)
                    feeds.length.should == 2 
                    feeds[0][:title].to_s.should == 'test_atom_feed_title_1'
                    feeds[0][:url].to_s.should   == 'http://test_atom_feed_url_1/'
                    feeds[1][:title].to_s.should == 'test_atom_feed_title_2'
                    feeds[1][:url].to_s.should   == 'http://test_atom_feed_url_2/'
                end
            end
        
            context 'contain rss and atom feed input' do
                it 'rss and atom feed' do
                     input = <<-EOS
                        <html><head>
                            <link rel="alternate" type="application/rss+xml" title="test_rss_feed_title" href="http://test_rss_feed_url/"/>
                            <link rel="alternate" type="application/atom+xml" title="test_atom_feed_title" href="http://test_atom_feed_url/"/>
                        </head></html>
                    EOS

                    feeds = RSSDetector::detect(input)
                    feeds.length.should == 2 
                    feeds[0][:title].to_s.should == 'test_rss_feed_title'
                    feeds[0][:url].to_s.should   == 'http://test_rss_feed_url/'
                    feeds[1][:title].to_s.should == 'test_atom_feed_title'
                    feeds[1][:url].to_s.should   == 'http://test_atom_feed_url/'
                end
            end
        end
    end
end
