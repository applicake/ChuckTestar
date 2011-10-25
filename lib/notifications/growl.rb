require "growl_notify"

GrowlNotify.config do |config|
  config.notifications = ["Chuck Testr"]
  config.default_notifications = ["Chuck Testr"]
  config.application_name = "Chuck Testr RSpec formatter" # this shoes up in the growl applications list in systems settings
end
