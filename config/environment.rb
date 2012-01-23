# Load the rails application
require File.expand_path('../application', __FILE__)

# START:threadsafe
Twitalytics::Application.configure do 
  config.threadsafe!
end
# END:threadsafe

# Initialize the rails application
Twitalytics::Application.initialize!
