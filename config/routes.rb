Twitalytics::Application.routes.draw do
  get "customers/index", :as => :customers

  get "company/index", :as => :company

  post "company/update", :as => :company_status

  get "dashboard/index"

  root :to => "dashboard#index"
end
