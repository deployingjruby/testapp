class UpdateAnalytics
  @queue = :normal

  def self.perform
    puts "The analytics worker is running"
  end
end