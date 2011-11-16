module TwitterUtil
  def with_twitter_client
    with_twitter_account do |username, password|
      with_twitter_stream_config do |keywords|
        yield TweetStream::Client.new(username, password), keywords
      end
    end
  end

  def fetch_recent_tweets(num)
    with_twitter_stream_config do |keywords|
      search = Twitter::Search.new
      results = search.
          containing(keywords.join(" ")).
          result_type("recent").
          per_page(num).each {|t|}
      search.clear
      results
    end
  end

  def with_twitter_account
    cnfg = YAML.load_file("#{Rails.root}/config/twitter_account.yml")
    yield cnfg['username'], cnfg['password']
  end

  def with_twitter_stream_config
    twitter_stream_config = YAML.load_file("#{Rails.root}/config/twitter_stream.yml")
    yield twitter_stream_config['keywords']
  end
end
