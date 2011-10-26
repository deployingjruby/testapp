# START:db
Warbler::Config.new do |config|
  config.dirs << "db"
  # END:db
  config.includes = FileList["Rakefile"]
  # START:db
end
# END:db
