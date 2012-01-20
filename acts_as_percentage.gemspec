# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_percentage/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_percentage"
  s.version     = ActsAsPercentage::VERSION
  s.authors     = ["Jared McFarland"]
  s.email       = ["jared.online@gmail.com"]
  s.homepage    = ""
  s.summary     = "Adds simple percentage and ratio helpers to ActiveRecord and allows percents to be stored as an Integer"
  s.description = "Because most percentages only need to be accurate to two decimals, this gem has you store them as basis points and does the conversion for you."

  s.rubyforge_project = "acts_as_percentage"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "activerecord", "~> 3.1.0"
  
  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "sqlite3-ruby"
  # s.add_runtime_dependency "rest-client"
end
