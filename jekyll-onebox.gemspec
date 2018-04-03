# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-onebox/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-onebox"
  spec.version       = Jekyll::Onebox::VERSION
  spec.authors       = ["Robert Riemann"]
  spec.email         = ["robert@riemann.cc"]
  spec.summary       = "Liquid tag for displaying HTML previews (embeds) for links."
  spec.homepage      = "https://github.com/rriemann/jekyll-onebox"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r!^bin/!) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r!^(test|spec|features)/!)
  spec.require_paths = ["lib"]

  spec.add_dependency "onebox", "~> 1.8"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "jekyll", ">= 3.0"
  spec.add_development_dependency "rake"
end
