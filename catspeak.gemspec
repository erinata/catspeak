# -*- encoding: utf-8 -*-  
$:.push File.expand_path("../lib", __FILE__)
require "catspeak/version"

Gem::Specification.new do |s|
  s.name        = "catspeak"
  s.version     = Catspeak::VERSION
  s.authors     = ["erinata"]
  s.email       = ["erinata@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Catspeak provides translation between English and Cats' language}
  s.description = %q{You can view it as some kind of encryption and decrpytion gem........... but cats do speak.}
  # TODO: write better description  
  s.rubyforge_project = "catspeak"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end



