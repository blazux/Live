# -*- encoding: utf-8 -*-
# stub: network_interface 0.0.1 ruby lib
# stub: ext/network_interface_ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "network_interface"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brandon Turner", "Lance Sanchez"]
  s.date = "2013-07-08"
  s.description = "\n     This gem was originally added to the Metasploit Pcaprub gem. It's been spun\n     out into its own gem for anyone who might want to programmatically get\n     information on their network interfaces. "
  s.email = ["lance.sanchez@rapid7.com", "brandon_turner@rapid7.com"]
  s.extensions = ["ext/network_interface_ext/extconf.rb"]
  s.files = ["ext/network_interface_ext/extconf.rb"]
  s.homepage = "https://github.com/rapid7/network_interface"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "A cross platform gem to help get network interface information"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
