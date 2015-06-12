# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'happyapps/version'

Gem::Specification.new do |spec|
  spec.name          = "happyapps"
  spec.version       = HappyApps::VERSION
  spec.authors       = ["David Estes"]
  spec.email         = ["davydotcom@gmail.com"]
  spec.summary       = "A small API library for interfacing with the HappyApps API"
  spec.description   = "Provides methods to query and update data sets within happyapps.io API"
  spec.homepage      = "http://www.happyapps.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'rest-client'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
