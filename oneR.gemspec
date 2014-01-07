# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oneR/version'

Gem::Specification.new do |spec|
  spec.name          = "oneR"
  spec.version       = OneR::VERSION
  spec.authors       = ["Simon"]
  spec.email         = ["simonroy@thoughtworks.com"]
  spec.description   = %q{Helps in maintaining and running one time tasks}
  spec.summary       = %q{Manages and runs one time tasks}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "json"
end
