# -*- encoding: utf-8 -*-
# stub: rkelly-remix 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "rkelly-remix"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Patterson", "Rene Saarsoo"]
  s.date = "2013-12-10"
  s.description = "RKelly Remix is a fork of the\nRKelly[https://github.com/tenderlove/rkelly] JavaScript parser."
  s.email = ["aaron.patterson@gmail.com", "rene.saarsoo@sencha.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.homepage = "https://github.com/nene/rkelly-remix"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubyforge_project = "rkelly-remix"
  s.rubygems_version = "2.5.1"
  s.summary = "RKelly Remix is a fork of the RKelly[https://github.com/tenderlove/rkelly] JavaScript parser."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
  end
end
