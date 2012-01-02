# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Twitalytics::Application.initialize!

# START:threadsafe
Twitalytics::Application.configure do
  config.threadsafe!
end
# END:threadsafe