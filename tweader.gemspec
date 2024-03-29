# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tweader/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Carver"]
  gem.email         = ["ryan@ryancarver.com"]
  gem.description   = %q{A tiny library to read from Google Reader and write to Twitter}
  gem.summary       = %q{A tiny library to read from Google Reader and write to Twitter}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tweader"
  gem.require_paths = ["lib"]
  gem.version       = Tweader::VERSION

  gem.add_dependency "GoogleReaderApi", ["~>0.4.0"]
  gem.add_dependency "twitter", ["~>4.4.0"]
  gem.add_dependency "twitter_oauth", ["~>0.4.4"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~>4.0"
end
