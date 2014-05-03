# -*- encoding: utf-8 -*-
require File.expand_path('../lib/credly/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gonzalo Rodríguez-Baltanás Díaz"]
  gem.email         = ["gonzalor@haikuls.com"]
  gem.description   = %q{ruby client for the Credly API}
  gem.homepage      = "https://github.com/haikulearning/credly-ruby"
  gem.summary       = gem.description

  gem.name          = "credly"
  gem.require_paths = ["lib"]
  gem.files         = `git ls-files`.split("\n")
  gem.version       = Credly::VERSION

  gem.add_dependency 'faraday'
  gem.add_dependency 'activesupport'
  gem.add_dependency 'multi_json'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry-debugger'
  gem.add_development_dependency 'json_spec'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rb-inotify'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'rb-fchange'
  gem.add_development_dependency 'ruby_gntp'
  gem.add_development_dependency 'faraday'
  gem.add_development_dependency 'fabrication'
  gem.add_development_dependency 'fuubar'
  gem.add_development_dependency 'awesome_print'

end
