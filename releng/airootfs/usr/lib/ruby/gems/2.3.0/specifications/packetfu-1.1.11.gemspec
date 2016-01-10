# -*- encoding: utf-8 -*-
# stub: packetfu 1.1.11 ruby lib

Gem::Specification.new do |s|
  s.name = "packetfu"
  s.version = "1.1.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tod Beardsley"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDbDCCAlSgAwIBAgIBATANBgkqhkiG9w0BAQUFADA+MQ0wCwYDVQQDDAR0b2Ri\nMRgwFgYKCZImiZPyLGQBGRYIcGFja2V0ZnUxEzARBgoJkiaJk/IsZAEZFgNjb20w\nHhcNMTUwODI1MTQ1MzQ2WhcNMTYwODI0MTQ1MzQ2WjA+MQ0wCwYDVQQDDAR0b2Ri\nMRgwFgYKCZImiZPyLGQBGRYIcGFja2V0ZnUxEzARBgoJkiaJk/IsZAEZFgNjb20w\nggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDl/jdqB/u4WnnAV7ds6U7r\nkffHRJCMc1+s0lvjnWMnZuegjJkuElm0jNQnkUzNqhJGI2NVDc1COoT6VHsEPRi8\nuD8po+7pisLwqUHIyx8PFu+pGSRGawEgAPT5DfEf9MwGTob1G9vm1Hv7rTMN+S1X\nnMIxpFwiMilhLKdoTEZAo0moFbWEVK4ZuEaNkPXGxFKEdnpyb8Fi+/akzwWtwRp1\nByJktlF3YIZgAimvY/PtV0V1n+Mktoz+706EUDe/ZnD8M+o6orzqryCiQrqdzJyk\ncPv7u1RuG1VPC8mK5TmB9lqlMPi/hxbjC4LfhJsZYoO1AF6baZ8HzqCISInBLwyd\nAgMBAAGjdTBzMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBS/B6/d\nCN84yx061Q/xqilGxY4qqTAcBgNVHREEFTATgRF0b2RiQHBhY2tldGZ1LmNvbTAc\nBgNVHRIEFTATgRF0b2RiQHBhY2tldGZ1LmNvbTANBgkqhkiG9w0BAQUFAAOCAQEA\nOz/R618bt2/QxwL1wM6bP/yb+xNd/DR8aOUeKZwarfWuo6zhVY03qiydlElHU0YJ\nRl0/JGQIHNVUzIr3J/QXv225LUECYTejPKC8LcELdfjSfUwzTd75zrGisL0//a4m\n+Zcv8PSfdOCug3jj5EDMVZe/sX7G4vEqM81SaQaUYFltKGk2YUrlYJsNGW6Yp4As\nc4y7lD0Rc4OsaoWT5ozhFBJv1qSuoL1y1qySsVazbc0jYjxm6HkVWqOd1cO5zO74\nAFvBtuFFTUDdrs3M/q6ktx295osXr2XpaygJmhkMLj81xoIX9G8eEjPc/XQWDlI1\nma/kCj5vaQ3hma/0DsajCg==\n-----END CERTIFICATE-----\n"]
  s.date = "2015-08-25"
  s.description = "PacketFu is a mid-level packet manipulation library for Ruby. With it, users can read, parse, and write network packets with the level of ease and fun they expect from Ruby. Note that this gem does not automatically require pcaprub, since users may install pcaprub through non-gem means."
  s.email = "todb@packetfu.com"
  s.extra_rdoc_files = [".document", "README.rdoc"]
  s.files = [".document", "README.rdoc"]
  s.homepage = "https://github.com/todb/packetfu"
  s.licenses = ["BSD"]
  s.rubyforge_project = "packetfu"
  s.rubygems_version = "2.5.1"
  s.summary = "PacketFu is a mid-level packet manipulation library."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<network_interface>, ["~> 0.0"])
      s.add_runtime_dependency(%q<pcaprub>, ["~> 0.12"])
      s.add_development_dependency(%q<rake>, ["~> 10.3"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>, ["~> 1.2"])
      s.add_development_dependency(%q<sdoc>, ["~> 0.4.1"])
    else
      s.add_dependency(%q<network_interface>, ["~> 0.0"])
      s.add_dependency(%q<pcaprub>, ["~> 0.12"])
      s.add_dependency(%q<rake>, ["~> 10.3"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>, ["~> 1.2"])
      s.add_dependency(%q<sdoc>, ["~> 0.4.1"])
    end
  else
    s.add_dependency(%q<network_interface>, ["~> 0.0"])
    s.add_dependency(%q<pcaprub>, ["~> 0.12"])
    s.add_dependency(%q<rake>, ["~> 10.3"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>, ["~> 1.2"])
    s.add_dependency(%q<sdoc>, ["~> 0.4.1"])
  end
end
