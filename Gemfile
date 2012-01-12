source 'http://rubygems.org'

gem 'rails', '3.1.1'

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

# START:get_back
platform :jruby do
  gem "get_back"
  # END:get_back
  # START:jruby_openssl
  gem "jruby-openssl"
  # END:jruby_openssl
  # START:get_back
end
# END:get_back

group :test do
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'execjs'
  gem 'selenium-client', :require => 'selenium/client'
  gem 'selenium-webdriver'
  gem 'headless'
  gem 'minitest'
end

# START:db_driver
group :production do
  gem 'jdbc-postgres'
end
# END:production

group :development, :test do
  # START:sqlite
  gem 'jdbc-sqlite3'
  # END:sqlite
end
# END:db_driver