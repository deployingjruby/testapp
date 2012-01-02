module TwitterUtil
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

  def fetch_tweets_since(since_id)
    with_twitter_stream_config do |keywords|
      search = Twitter::Search.new
      if since_id
        results = search.
            containing(keywords.join(" ")).
            result_type("recent").
            since_id(since_id).each {|t|}
      else
        results = search.
            containing(keywords.join(" ")).
            result_type("recent").
            per_page(20).each {|t|}
      end
      search.clear
      results.sort{|x,y| x["created_at"] <=> y["created_at"]}.each {|r| yield r }
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
