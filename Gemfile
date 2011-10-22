source 'http://rubygems.org'

gem 'rails', '3.1.0'

# START:sqlite
if defined?(JRUBY_VERSION)
  gem 'activerecord-jdbc-adapter', :require => false
  gem 'jdbc-sqlite3', :require => false
else
  gem 'sqlite3-ruby', :require => 'sqlite3'
end
# END:sqlite

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem "json"
gem "tweetstream", "1.0.4"
gem 'twitter', '~> 1.7.2'

platform :jruby do
  gem "get_back"
  gem "jruby-openssl"
end

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
