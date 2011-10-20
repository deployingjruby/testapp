Twitalytics::Application.routes.draw do
  get "customers/index", :as => :customers

  get "company/index", :as => :company

  get "dashboard/index"

  root :to => "dashboard#index"
end
