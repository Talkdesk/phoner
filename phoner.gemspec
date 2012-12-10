# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phoner/version'

Gem::Specification.new do |gem|
  gem.name          = "phoner"
  gem.version       = Phoner::VERSION
  gem.authors       = ['Tomislav Car', 'Todd Eichel', 'Don Morrison', 'Wesley Moxam', 'Paul Chavard']
  gem.email         = ['tomislav@infinum.hr', 'todd@toddeichel.com', 'elskwid@gmail.com', 'wesley.moxam@gmail.com', "paul@chavard.net"]

  gem.description = "Phone number parsing, validation and formatting."
  gem.summary = "Phone number parsing, validation and formatting"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activesupport"
  gem.add_development_dependency "rake"
end
