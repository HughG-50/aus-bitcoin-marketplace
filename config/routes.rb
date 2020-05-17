Rails.application.routes.draw do
  devise_for :users

  # listings routes
  resources :listings
  get "/listings/:id/show_basic", to: "listings#show_basic", as: "show_basic"

  # homepage route
  get "/", to: "pages#home", as: "root"

  # profile page routes
  get "/profile/:id", to: "profiles#index", as: "user"
  get "/profile/:id/show", to: "profiles#show"
  put "/profile/:id", to: "profiles#edit"
  patch "/profile/:id", to: "profiles#edit"
  post "/profile/:id", to: "profiles#update"
  get "/profile/:id/edit", to: "profiles#edit", as: "edit_profile"

  # Dashboard routes
  get "/dashboard/:id/pending_listings", to: "dashboards#pending_listings_index", as: "pending_listings"
  get "/dashboard/:id/current_listings", to: "dashboards#current_listings_index", as: "current_listings"
  get "/dashboard/:id/completed_listings", to: "dashboards#completed_listings_index", as: "completed_listings"
  get "/dashboard/:id/current_purchase_orders", to: "dashboards#current_purchase_orders_index", as: "current_purchase_orders"
  get "/dashboard/:id/purchase_history", to: "dashboards#purchase_history_index", as: "purchase_history"
end
