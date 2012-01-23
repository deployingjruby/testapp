# START:db
Warbler::Config.new do |config|
  config.dirs << "db"
  # END:db
  config.includes = FileList["Rakefile"]
  config.excludes = FileList["**/*/*.box"]
  # START:db
end
# END:db
