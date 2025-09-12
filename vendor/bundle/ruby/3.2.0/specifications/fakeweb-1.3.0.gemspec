# -*- encoding: utf-8 -*-
# stub: fakeweb 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fakeweb".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Kampmeier".freeze, "Blaine Cook".freeze]
  s.date = "2010-08-22"
  s.description = "FakeWeb is a helper for faking web requests in Ruby. It works at a global level, without modifying code or writing extensive stubs.".freeze
  s.email = ["chris@kampers.net".freeze, "romeda@gmail.com".freeze]
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE.txt".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/chrisk/fakeweb".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A tool for faking responses to HTTP requests".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 3

  s.add_development_dependency(%q<mocha>.freeze, [">= 0.9.5"])
end
