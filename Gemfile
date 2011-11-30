source :rubygems

gemspec

gem 'rake'

require 'rbconfig'
gem 'ruby-debug19', :platforms => :ruby_19
gem 'ruby-debug', :platforms => :ruby_18

platforms :ruby do
  if Config::CONFIG['target_os'] =~ /darwin/i
    gem 'growl_notify', '~> 0.0.3'
  end
  if Config::CONFIG['target_os'] =~ /linux/i
    gem 'rb-fsevent'
  end
end

platforms :jruby do
  if Config::CONFIG['target_os'] =~ /darwin/i
    gem 'growl_notify', '~> 0.0.3'
  end
  if Config::CONFIG['target_os'] =~ /linux/i
    gem 'rb-fsevent'
  end
end