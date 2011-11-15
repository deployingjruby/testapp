class Status < ActiveRecord::Base

  def self.find_or_create_from(tweets)
    tweets.map do |tweet|
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
  end
end
