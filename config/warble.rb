Warbler::Config.new do |config|
  if ENV['RAILS_ENV'] == 'development'
    config.dirs << "db"
  end
end
