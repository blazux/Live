# -*- encoding: utf-8 -*-
# stub: filesize 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "filesize"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dominik Honnef"]
  s.date = "2015-09-05"
  s.description = "filesize is a small class for handling filesizes with both the SI and binary prefixes, allowing conversion from any size to any other size."
  s.email = "dominikh@fork-bomb.org"
  s.homepage = "https://github.com/dominikh/filesize"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.rubygems_version = "2.5.1"
  s.summary = "filesize is a small class for handling filesizes with both the SI and binary prefixes, allowing conversion from any size to any other size."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
