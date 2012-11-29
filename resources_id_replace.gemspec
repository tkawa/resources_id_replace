# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resources_id_replace/version'

Gem::Specification.new do |gem|
  gem.name          = "resources_id_replace"
  gem.version       = ResourcesIdReplace::VERSION
  gem.authors       = ["Toru KAWAMURA"]
  gem.email         = ["tkawa@4bit.net"]
  gem.description   = %q{Replace param name of resources' id}
  gem.summary       = %q{Replace param name of resources' id}
  gem.homepage      = "https://github.com/tkawa/resources_id_replace"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'actionpack', '>= 3.0.0'
  gem.add_development_dependency 'rake'
end
