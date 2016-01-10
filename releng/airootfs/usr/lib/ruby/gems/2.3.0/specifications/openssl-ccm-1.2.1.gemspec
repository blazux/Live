# -*- encoding: utf-8 -*-
# stub: openssl-ccm 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "openssl-ccm"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Lars Schmertmann"]
  s.date = "2015-09-28"
  s.description = "Ruby Gem for RFC 3610 - Counter with CBC-MAC (CCM)"
  s.email = ["SmallLars@t-online.de"]
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "https://github.com/smalllars/openssl-ccm"
  s.licenses = ["MIT"]
  s.post_install_message = "Thanks for installing!"
  s.rdoc_options = ["-x", "test/data_*"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "RFC 3610 - CCM"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 10.4.2", "~> 10.4"])
      s.add_development_dependency(%q<rdoc>, [">= 4.2.0", "~> 4.2"])
      s.add_development_dependency(%q<yard>, [">= 0.8.7.6", "~> 0.8"])
      s.add_development_dependency(%q<rubocop>, [">= 0.34.2", "~> 0.34"])
      s.add_development_dependency(%q<test-unit>, [">= 3.1.4", "~> 3.1"])
      s.add_development_dependency(%q<coveralls>, [">= 0.8.2", "~> 0.8"])
    else
      s.add_dependency(%q<rake>, [">= 10.4.2", "~> 10.4"])
      s.add_dependency(%q<rdoc>, [">= 4.2.0", "~> 4.2"])
      s.add_dependency(%q<yard>, [">= 0.8.7.6", "~> 0.8"])
      s.add_dependency(%q<rubocop>, [">= 0.34.2", "~> 0.34"])
      s.add_dependency(%q<test-unit>, [">= 3.1.4", "~> 3.1"])
      s.add_dependency(%q<coveralls>, [">= 0.8.2", "~> 0.8"])
    end
  else
    s.add_dependency(%q<rake>, [">= 10.4.2", "~> 10.4"])
    s.add_dependency(%q<rdoc>, [">= 4.2.0", "~> 4.2"])
    s.add_dependency(%q<yard>, [">= 0.8.7.6", "~> 0.8"])
    s.add_dependency(%q<rubocop>, [">= 0.34.2", "~> 0.34"])
    s.add_dependency(%q<test-unit>, [">= 3.1.4", "~> 3.1"])
    s.add_dependency(%q<coveralls>, [">= 0.8.2", "~> 0.8"])
  end
end
