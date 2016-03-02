# -*- encoding: utf-8 -*-
# stub: pcaprub 0.12.1 ruby lib
# stub: ext/pcaprub_c/extconf.rb

Gem::Specification.new do |s|
  s.name = "pcaprub"
  s.version = "0.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["shadowbq", "crondaemon", "jmcavinee", "unmarshal"]
  s.date = "2016-01-20"
  s.description = "libpcap bindings for ruby with Ruby1.8, Ruby1.9, Ruby 2.x"
  s.email = "shadowbq@gmail.com"
  s.extensions = ["ext/pcaprub_c/extconf.rb"]
  s.extra_rdoc_files = ["FAQ.rdoc", "LICENSE", "README.rdoc", "USAGE.rdoc", "ext/pcaprub_c/pcaprub.c"]
  s.files = ["FAQ.rdoc", "LICENSE", "README.rdoc", "USAGE.rdoc", "ext/pcaprub_c/extconf.rb", "ext/pcaprub_c/pcaprub.c"]
  s.homepage = "https://github.com/pcaprub/pcaprub"
  s.licenses = ["LGPL-2.1"]
  s.requirements = ["libpcap"]
  s.rubygems_version = "2.5.1"
  s.summary = "libpcap bindings for ruby"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2", "~> 0.9"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0.6.0", "~> 0.6"])
      s.add_development_dependency(%q<shoulda-context>, ["~> 1.1", "~> 1.1.6"])
      s.add_development_dependency(%q<minitest>, [">= 4.7.0", "~> 4.7"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0.9.2", "~> 0.9"])
      s.add_dependency(%q<rake-compiler>, [">= 0.6.0", "~> 0.6"])
      s.add_dependency(%q<shoulda-context>, ["~> 1.1", "~> 1.1.6"])
      s.add_dependency(%q<minitest>, [">= 4.7.0", "~> 4.7"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0.9.2", "~> 0.9"])
    s.add_dependency(%q<rake-compiler>, [">= 0.6.0", "~> 0.6"])
    s.add_dependency(%q<shoulda-context>, ["~> 1.1", "~> 1.1.6"])
    s.add_dependency(%q<minitest>, [">= 4.7.0", "~> 4.7"])
  end
end
