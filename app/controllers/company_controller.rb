class CompanyController < ApplicationController
  include TwitterUtil

  def index
    with_twitter_account do |username|
      @statuses = (Twitter.user_timeline(username)).map do |status|
        {:created_at => status.created_at, :status_text => status.text}
      end
    end
  end

  # START:fork
  def update
    child = fork do
      post_update(params[:status_text])
    end
    Process.detach(child)
    
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
  # END:fork
end
