class CustomersController < ApplicationController
  include TwitterUtil

  def index
    @statuses =  Status.find_or_create_from(
        fetch_recent_tweets(20)
    )
  end

  def retweet
    Status.find(params[:id]).retweet
    redirect_to customers_path
  end
end
