# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-bitbucket/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-bitbucket"
  s.version     = Omniauth::Bitbucket::VERSION
  s.authors     = ["Dingding Ye"]
  s.email       = ["yedingding@gmail.com"]
  s.homepage    = "https://github.com/codeship/omniauth-bitbucket"
  s.summary     = %q{OmniAuth strategy for Bitbucket.}
  s.description = %q{OmniAuth strategy for Bitbucket.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency 'omniauth', '~> 1.1'
  s.add_dependency 'omniauth-oauth', '~> 1.0'
  s.add_dependency 'multi_json', '>= 1.15.0', '< 2.0'

  s.add_development_dependency 'rspec', '~> 3'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rake'
end
