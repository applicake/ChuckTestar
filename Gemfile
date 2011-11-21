source :rubygems

gem 'growl_notify' unless `uname` =~ /(linux|Linux)/

group :development do
  gem "rspec"
  gem "ruby-debug19" if RUBY_VERSION =~ /1.9/
  gem "ruby-debug" if RUBY_VERSION =~ /1.8/
  gem "awesome_print"
  gem "interactive_editor"
  gem 'rb-fsevent' unless `uname` =~ /(linux|Linux)/
  gem 'guard'
  gem 'guard-rspec'
end

group :test do
  gem "spork", "~> 0.9.0.rc4"
  gem 'simplecov', '>= 0.4.2', :require => false
  gem 'guard-spork'
end
