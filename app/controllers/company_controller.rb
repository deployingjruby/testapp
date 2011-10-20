class CompanyController < ApplicationController
  include TwitterUtil

  def index
    with_twitter_account do |username|
      @statuses = (Twitter.user_timeline(username)).map do |status|
        {:created_at => status.created_at, :status_text => status.text}
      end
    end
  end

end
