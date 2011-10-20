module TwitterUtil
  def with_twitter_client
    with_twitter_config do |username, password, keywords|
      yield TweetStream::Client.new(username, password), keywords
    end
  end

  def with_twitter_config
    twitalytics_config = YAML.load_file("#{Rails.root}/config/twitalytics.yml")
    twitter_stream_config = YAML.load_file("#{Rails.root}/config/twitter_stream.yml")
    yield twitalytics_config['account']['username'],
          twitalytics_config['account']['password'],
          twitter_stream_config['keywords']
  end
end