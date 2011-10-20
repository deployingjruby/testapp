class CompanyController < ApplicationController

  def index
    @statuses = (Twitter.user_timeline("codefinger")).map do |status|
      {:created_at => status.created_at, :status_text => status.text}
    end
  end

end
