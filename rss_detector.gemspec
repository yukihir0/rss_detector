# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rss_detector/version'

Gem::Specification.new do |gem|
  gem.name          = "rss_detector"
  gem.version       = RssDetector::VERSION
  gem.authors       = ["yukihir0"]
  gem.email         = ["yukihiro.cotori@gmail.com"]
  gem.description   = %q{'rss_detector' provides feature for feed detection from html document.}
  gem.summary       = %q{'rss_detector' provides feature for feed detection from html document.}
  gem.homepage      = "https://github.com/yukihir0/rss_detector"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri", "~>1.5"
  gem.add_development_dependency "rake", "~>10.4.2"
  gem.add_development_dependency "rspec", "~>3.3.0"
  gem.add_development_dependency "coveralls", "~>0.8.2"
end
