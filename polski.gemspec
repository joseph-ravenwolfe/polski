# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polski/version'

Gem::Specification.new do |spec|
  spec.name          = "polski"
  spec.version       = Polski::VERSION
  spec.authors       = ["Joseph Jaber"]
  spec.email         = ["mail@josephjaber.com"]
  spec.summary       = %q{A calculator using reverse polish notation.}
  spec.description   = %q{A calculator using reverse polish notation.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "yard"
end
