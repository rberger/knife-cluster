# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "knife-cluster/version"

Gem::Specification.new do |s|
  s.name        = "knife-cluster"
  s.version     = Knife::Cluster::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robert J. Berger", "Philip (flip) Kromer"]
  s.email       = ["rberger@runa.com", "flip@infochimps.com"]
  s.homepage    = "http://groups.google.com/group/infochimps-code"
  s.summary     = %q{knife plugin for hadoop cluster management}
  s.description = %q{knife plugin for hadoop cluster management}

  s.rubyforge_project = "knife-cluster"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "bundler"
  s.add_development_dependency "rspec", ">= 2.5.0"
  s.add_dependency "fog"
  # s.add_dependency "chef", "~> 0.10.0"
end
