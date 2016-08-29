# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "multiblock/version"

Gem::Specification.new do |spec|
  spec.name          = "multiblock"
  spec.version       = Multiblock::VERSION
  spec.authors       = ["Michał Szajbe"]
  spec.email         = ["michal.szajbe@gmail.com"]
  spec.description   = %q{Ruby methods can accept only one block at a time. Multiblock helps to build multiple-block wrappers that can be passed to Ruby methods in pleasant way.}
  spec.summary       = %q{Pass multiple blocks to Ruby methods with style}
  spec.homepage      = "http://github.com/humante/multiblock"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
