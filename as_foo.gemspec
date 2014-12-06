# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'as_foo/version'

Gem::Specification.new do |spec|
  spec.name          = "as_foo"
  spec.version       = AsFoo::VERSION
  spec.authors       = ["tmaeda"]
  spec.email         = ["tmaeda@ruby-sapporo.org"]
  spec.summary       = "Convert ruby string to foo."
  spec.description   = ""
  spec.homepage      = "https://github.com/tmaeda/as_foo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
