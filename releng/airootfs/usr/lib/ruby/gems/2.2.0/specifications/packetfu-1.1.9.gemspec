# -*- encoding: utf-8 -*-
# stub: packetfu 1.1.9 ruby lib

Gem::Specification.new do |s|
  s.name = "packetfu"
  s.version = "1.1.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tod Beardsley"]
  s.date = "2013-09-12"
  s.description = "PacketFu is a mid-level packet manipulation library for Ruby. With it, users can read, parse, and write network packets with the level of ease and fun they expect from Ruby. Note that this gem does not automatically require pcaprub, since users may install pcaprub through non-gem means."
  s.email = "todb@packetfu.com"
  s.extra_rdoc_files = [".document", "README.rdoc"]
  s.files = [".document", "README.rdoc"]
  s.homepage = "https://github.com/todb/packetfu"
  s.licenses = ["BSD"]
  s.rubyforge_project = "packetfu"
  s.rubygems_version = "2.4.5"
  s.summary = "PacketFu is a mid-level packet manipulation library."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<pcaprub>, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec>, [">= 2.6.2"])
      s.add_development_dependency(%q<sdoc>, [">= 0.2.0"])
    else
      s.add_dependency(%q<pcaprub>, [">= 0.9.2"])
      s.add_dependency(%q<rspec>, [">= 2.6.2"])
      s.add_dependency(%q<sdoc>, [">= 0.2.0"])
    end
  else
    s.add_dependency(%q<pcaprub>, [">= 0.9.2"])
    s.add_dependency(%q<rspec>, [">= 2.6.2"])
    s.add_dependency(%q<sdoc>, [">= 0.2.0"])
  end
end
