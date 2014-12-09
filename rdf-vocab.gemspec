# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdf-vocab/version'

Gem::Specification.new do |spec|
  spec.name          = "rdf-vocab"
  spec.version       = RDF::Vocab::VERSION
  spec.authors       = ["David Chandek-Stark"]
  spec.email         = ["dchandekstark@gmail.com"]
  spec.summary       = %q{A library of RDF vocabularies and vocabulary-building tools}
  spec.description   = %q{A library of RDF vocabularies and vocabulary-building tools}
  spec.homepage      = "https://github.com/projecthydra-labs/rdf-vocab"
  spec.license       = "APACHE2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "linkeddata"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.1"
end
