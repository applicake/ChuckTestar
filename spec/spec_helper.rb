#require 'simplecov'
#SimpleCov.start

require 'rubygems'
require 'spork'

Spork.prefork do
  $:.unshift File.expand_path('../../lib', __FILE__)

  require 'rubygems'
  require 'bundler'
  Bundler.setup
  require 'rspec'
  Dir[File.join(File.expand_path('../', __FILE__), "support/**/*.rb")].each do |file|
    require file
  end

  require 'ChuckTestar'
end

Spork.each_run do

end

