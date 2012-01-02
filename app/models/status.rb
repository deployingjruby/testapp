class Status < ActiveRecord::Base

  def self.find_or_create_from(tweets)
    r = tweets.map do |tweet|
      existing = Status.where(:remote_id => tweet.id_str).first
      existing.nil? ?
          Status.create(
            :created_at => tweet.created_at,
            :status_text => tweet.text,
            :creator => tweet.from_user,
            :remote_id => tweet.id_str
          ) :
          existing
    end

    #Resque.enqueue(UpdateAnalytics)

    r
  end

  def retweet
    sleep(10)
    # Twitter.update("RT @#{creator}: {status_text}")
    puts "Retweeting Status{id=#{id}}"
  end
end
