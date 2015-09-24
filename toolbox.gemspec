$:.push File.expand_path("../lib", __FILE__)

require "toolbox/version"

Gem::Specification.new do |s|
  s.name        = "toolbox"
  s.version     = Toolbox::VERSION
  s.authors     = ["J. R. Schmid"]
  s.email       = ["jrs@weitnahbei.de"]
  s.homepage    = "http://weitnahbei.de"
  s.summary     = "Toolbox for Rails projects."
  s.description = "Some help with some of the little things that keep popping up when starting any new Rails project."
  s.license     = "GPL3"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "browser", ">= 1.0.1"
  s.add_dependency "active_record"

  s.add_development_dependency "sqlite3"
end
