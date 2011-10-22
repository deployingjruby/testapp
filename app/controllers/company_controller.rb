class CompanyController < ApplicationController
  include TwitterUtil

  def index
    with_twitter_account do |username, *|
      @statuses = (Twitter.user_timeline(username)).map do |status|
        {:created_at => status.created_at, :status_text => status.text}
      end
    end
  end

  # START:fork
  def update
    child = fork do
      # We won't actually update because that requires an OAuth token.
      # Twitter.update(params[:status_text])
      sleep 10
      puts "update posted successfuly"
    end
    Process.detach(child)
    
    flash[:notice] = "Status updated!"
    redirect_to company_path
  end
  # END:fork
end
