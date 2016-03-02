# -*- encoding: utf-8 -*-
# stub: jsobfu 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jsobfu"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["James Lee", "Joe Vennix"]
  s.date = "2016-01-28"
  s.email = "joev@metasploit.com"
  s.executables = ["jsobfu"]
  s.files = ["bin/jsobfu"]
  s.homepage = "https://github.com/rapid7/jsobfu"
  s.licenses = ["BSD-3-Clause"]
  s.rubygems_version = "2.5.1"
  s.summary = "A Javascript code obfuscator"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rkelly-remix>, ["= 0.0.6"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<execjs>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<rkelly-remix>, ["= 0.0.6"])
      s.add_dependency(%q<rspec>, ["~> 3.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<execjs>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<rkelly-remix>, ["= 0.0.6"])
    s.add_dependency(%q<rspec>, ["~> 3.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<execjs>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
