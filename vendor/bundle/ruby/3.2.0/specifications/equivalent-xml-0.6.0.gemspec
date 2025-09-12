# -*- encoding: utf-8 -*-
# stub: equivalent-xml 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "equivalent-xml".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael B. Klein".freeze]
  s.date = "2015-04-21"
  s.description = "Compares two XML Nodes (Documents, etc.) for certain semantic equivalencies. \n    Currently written for Nokogiri, but with an eye toward supporting multiple XML libraries".freeze
  s.email = "mbklein@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/mbklein/equivalent-xml".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Easy equivalency tests for Ruby XML".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.4.3"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.0.0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 1.2.4"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0.9.0"])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 3.12"])
end
