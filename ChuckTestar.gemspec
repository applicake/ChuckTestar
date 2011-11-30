lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'chuck_testar/version'

require 'bundler'

Gem::Specification.new do |s|
  s.name        = "ChuckTestar"
  s.version     = ChuckTesta::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Lusiak"]
  s.email       = ["mariusz@applicake.com"]
  s.homepage    = "http://applicake.com"
  s.summary     = %q{Chuck Testar Formatter for RSpec}
  s.description = %q{}

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency 'rspec'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'ruby-debug19' if RUBY_VERSION =~ /1.9/
  s.add_development_dependency "ruby-debug" if RUBY_VERSION =~ /1.8/
  s.add_development_dependency "awesome_print"
  s.add_development_dependency "interactive_editor"
  s.add_development_dependency 'rb-fsevent' unless `uname` =~ /(linux|Linux)/
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'spork', '~> 0.9.0.rc4'
  s.add_development_dependency 'simplecov', '>= 0.4.2'
  s.add_development_dependency 'guard-spork'

  s.files = %w( README.md ChuckTestar.gemspec ) + Dir["lib/**/*.rb"] + Dir["assets/*.png"]
  s.test_files = Dir["spec/**/*.rb"]
  s.require_paths = ["lib"]
end
