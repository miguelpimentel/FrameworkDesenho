# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'e4commerce/version'

Gem::Specification.new do |spec|
  spec.name          = "e4commerce"
  spec.version       = E4commerce::VERSION
  spec.authors       = ["Miguel Pimentel"]
  spec.email         = ["miguelpimentel2013@gmail.com"]

  spec.summary       = %q{"Provide e-commerce structure and different payment methods"}
  spec.homepage      = "https://github.com/miguelpimentel/e4commerce"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
