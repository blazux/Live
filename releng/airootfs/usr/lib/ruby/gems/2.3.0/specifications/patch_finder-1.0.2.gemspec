# -*- encoding: utf-8 -*-
# stub: patch_finder 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "patch_finder"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["wchen-r7"]
  s.date = "2016-03-30"
  s.description = "Generic Patch Finder"
  s.email = ["wei_chen@rapid7.com"]
  s.executables = ["msu_finder"]
  s.files = ["bin/msu_finder"]
  s.homepage = "http://github.com/wchen-r7/patch-finder"
  s.licenses = ["BSD-3-clause"]
  s.rubygems_version = "2.5.1"
  s.summary = "Patch Finder"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.11"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.11"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
