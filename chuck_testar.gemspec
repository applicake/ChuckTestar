lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler'

Gem::Specification.new do |s|
  s.name        = "ChuckTestar"
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Lusiak"]
  s.email       = ["mariusz@applicake.com"]
  s.homepage    = "http://applicake.com"
  s.summary     = %q{Chuck Testar Formatter for RSpec}
  s.description = %q{}

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency 'rspec'
  s.add_runtime_dependency 'growl_notify' if RbConfig::CONFIG['host_os'] =~ /darwin/

  s.files = %w( README.md chuck_testar.gemspec ) + Dir["lib/**/*.rb"] + Dir["assets/*.png"]
  s.test_files = Dir["spec/**/*.rb"]
  s.require_paths = ["lib"]
end
