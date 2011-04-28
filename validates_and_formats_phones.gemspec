# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_and_formats_phones/version"

Gem::Specification.new do |s|
  s.name        = "validates_and_formats_phones"
  s.version     = ValidatesAndFormatsPhones::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bernardo Telles"]
  s.email       = ["btelles@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Allows you to easily format and validate phone numbers in any format you desire (sensible defaults provided).}
  s.description = %q{Allows you to easily format and validate phone numbers in any format you desire (sensible defaults provided).}

  s.rubyforge_project = "validates_and_formats_phones"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_development_dependency 'rspec'
  s.add_development_dependency 'jeweler'

  s.add_dependency 'activerecord', '~> 3.0.0'
end
