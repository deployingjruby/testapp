source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.1"
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier'
end

gem 'jquery-rails'
gem "json"
gem "tweetstream", "1.0.4"
gem 'twitter', '~> 1.7.2'

group :test do
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'execjs'
  gem 'therubyracer'
  gem 'selenium-client', :require => 'selenium/client'
  gem 'selenium-webdriver'
  gem 'headless'
  gem 'minitest'
end

# START:db_driver
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end
# END:db_driver