# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jetsetmeapi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["otaiga"]
  gem.email         = ["karl.turner5@gmail.com"]
  gem.description   = ["Basic gem for using the jetsetme api"]
  gem.summary       = ["started with simple auth commands"]
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jetsetmeapi"
  gem.require_paths = ["lib"]
  gem.version       = Jetsetmeapi::VERSION
end
