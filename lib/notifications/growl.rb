require "growl_notify"

GrowlNotify.config do |config|
  config.notifications = ["Chuck Testar"]
  config.default_notifications = ["Chuck Testar"]
  config.application_name = "Chuck Testar RSpec formatter" # this shoes up in the growl applications list in systems settings
end
