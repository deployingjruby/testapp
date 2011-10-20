#!/usr/bin/env ruby
ENV["RAILS_ENV"] ||= "production"

# load the rails environment
require File.dirname(__FILE__) + "/../../config/environment"

$running = true
Signal.trap("TERM") do
  $running = false
end

with_twitter_client do |client, keywords|
  thread = Thread.new do
    client.track(*keywords) do |status|
      puts "[#{status.user.screen_name}] #{status.text}"
      Status.create(
          :screen_name => status.user.screen_name,
          :status_text => status.text)
    end
  end

  while($running) do
    sleep 20
  end

  client.stop
  thread.join
end