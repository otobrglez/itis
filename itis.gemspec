# -*- encoding: utf-8 -*-
require File.expand_path('../lib/itis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Oto Brglez"]
  gem.email         = ["otobrglez@gmail.com"]
  gem.description   = %q{Ruby API for TIS}
  gem.summary       = %q{Ruby API and console client for Telefonski Imenik Slovenije}
  gem.homepage      = "https://github.com/otobrglez/itis"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "itis"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.1'

  gem.has_rdoc      = false
  gem.bindir        = 'bin'

  # gem.add_development_dependency 'mechanize'
  gem.add_dependency "httparty"
  gem.add_dependency "nokogiri"
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
end
