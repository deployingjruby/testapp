require 'spec_helper'

describe Status do
  context "#retweet" do
    it "turns tweet into status" do
      tweets = [
        mock_tweet("a", "joe", "123")
      ]

      s = Status.find_or_create_from(tweets)
      s.size.should == 1
      s[0].status_text.should == "a"
      s[0].creator.should == "joe"
      s[0].remote_id.should == "123"
    end
  end

  def mock_tweet(text, from_user, id_str)
    m = mock
    m.stub!(:created_at).and_return(Time.now)
    m.stub!(:text).and_return(text)
    m.stub!(:from_user).and_return(from_user)
    m.stub!(:id_str).and_return(id_str)
    m
  end
end
