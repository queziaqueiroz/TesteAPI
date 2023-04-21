# -*- encoding: utf-8 -*-
# stub: parameters 0.4.4 ruby lib

Gem::Specification.new do |s|
  s.name = "parameters".freeze
  s.version = "0.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Postmodern".freeze]
  s.date = "2012-06-17"
  s.description = "Parameters allows you to add annotated variables to your classes which may have configurable default values.".freeze
  s.email = "postmodern.mod3@gmail.com".freeze
  s.extra_rdoc_files = ["ChangeLog.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["ChangeLog.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "https://github.com/postmodern/parameters#readme".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Allows you to add annotated variables to your classes".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rubygems-tasks>.freeze, ["~> 0.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 2.4"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.7"])
  else
    s.add_dependency(%q<rubygems-tasks>.freeze, ["~> 0.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.4"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.7"])
  end
end
