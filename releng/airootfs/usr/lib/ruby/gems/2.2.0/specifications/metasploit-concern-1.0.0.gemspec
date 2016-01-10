# -*- encoding: utf-8 -*-
# stub: metasploit-concern 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "metasploit-concern"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Luke Imhoff"]
  s.date = "2015-05-11"
  s.description = "Automatically includes Modules from app/concerns/<module_with_concerns>/<concern>.rb into <module_with_concerns> to ease monkey-patching associations and validations on ActiveRecord::Base descendents from other gems when layering schemas."
  s.email = ["luke_imhoff@rapid7.com"]
  s.homepage = "https://github.com/rapid7/metasploit-concern"
  s.licenses = ["BSD-3-clause"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1")
  s.rubygems_version = "2.4.5"
  s.summary = "Automatically include Modules from app/concerns"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<metasploit-yard>, ["~> 1.0"])
      s.add_runtime_dependency(%q<activerecord>, ["< 4.1.0", ">= 4.0.9"])
      s.add_runtime_dependency(%q<activesupport>, ["< 4.1.0", ">= 4.0.9"])
      s.add_runtime_dependency(%q<railties>, ["< 4.1.0", ">= 4.0.9"])
    else
      s.add_dependency(%q<metasploit-yard>, ["~> 1.0"])
      s.add_dependency(%q<activerecord>, ["< 4.1.0", ">= 4.0.9"])
      s.add_dependency(%q<activesupport>, ["< 4.1.0", ">= 4.0.9"])
      s.add_dependency(%q<railties>, ["< 4.1.0", ">= 4.0.9"])
    end
  else
    s.add_dependency(%q<metasploit-yard>, ["~> 1.0"])
    s.add_dependency(%q<activerecord>, ["< 4.1.0", ">= 4.0.9"])
    s.add_dependency(%q<activesupport>, ["< 4.1.0", ">= 4.0.9"])
    s.add_dependency(%q<railties>, ["< 4.1.0", ">= 4.0.9"])
  end
end
