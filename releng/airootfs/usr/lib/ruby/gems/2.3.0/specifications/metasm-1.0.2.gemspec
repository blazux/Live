# -*- encoding: utf-8 -*-
# stub: metasm 1.0.2 ruby .

Gem::Specification.new do |s|
  s.name = "metasm"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["."]
  s.authors = ["Yoann Guillot"]
  s.date = "2014-12-23"
  s.description = ""
  s.email = ["john at ofjj.net"]
  s.homepage = "http://metasm.cr0.org"
  s.licenses = ["LGPL"]
  s.rubygems_version = "2.5.1"
  s.summary = "Metasm is a cross-architecture assembler, disassembler, linker, and debugger."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
