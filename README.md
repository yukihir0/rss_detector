# RSSDetector [![Build Status](https://travis-ci.org/yukihir0/rss_detector.png?branch=master)](https://travis-ci.org/yukihir0/rss_detector) [![Coverage Status](https://coveralls.io/repos/yukihir0/rss_detector/badge.svg?branch=master&service=github)](https://coveralls.io/github/yukihir0/rss_detector?branch=master)

'rss_detector' provides feature for feed detection from html document.

## Requirements

- ruby >= 2.0 
- [nokogiri](https://rubygems.org/gems/nokogiri)

## Install

```
gem install 'rss_detector'
```

or

```
gem 'rss_detector'
```

in your Gemfile.

## How to use

```
feed = RSSDetector::detect(html)
```

For more information, please see [here](https://github.com/yukihir0/rss_detector/blob/master/sample/sample.rb).

## License

Copyright &copy; 2013 yukihir0
