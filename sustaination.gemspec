Gem::Specification.new do |s|
  s.name        = "sustaination"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.author      = "Theo Cushion"
  s.email       = "theo.c@zepler.net"
  s.homepage    = "http://github.com/theozaurus/sustaination"
  s.summary     = "Wrapper for Sustaination.co API"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency 'json'
  s.add_dependency 'httparty'
  s.add_dependency 'nokogiri'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock', '~> 1.6'
  s.add_development_dependency 'rspec', '~> 2.4'

  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.mdown)
  s.test_files   = Dir.glob("spec/**/*") + %w(.rspec .infinity_test)
  s.require_path = 'lib'
end
