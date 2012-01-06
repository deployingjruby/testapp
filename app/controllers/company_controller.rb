# START:extend_get_back_jojo
class CompanyController < ApplicationController
  include TwitterUtil
  extend GetBack::JoJo
  # END:extend_get_back_jojo

  def index
    with_twitter_account do |username|
      @statuses = (Twitter.user_timeline(username)).map do |status|
        {:created_at => status.created_at, :status_text => status.text}
      end
    end
  end

  # START:get_back_post_update
  def update
    post_update(params[:status_text])
    flash[:notice] = "Status updated!"
    redirect_to company_path
  end

  private

  def post_update(text)
    # We won't actually update because that requires an OAuth token.
    # Twitter.update(text)
    sleep 10
    puts "update posted successfuly"
  end

  get_back :post_update, :pool => 10
  # END:get_back_post_update
end
