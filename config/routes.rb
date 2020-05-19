Rails.application.routes.draw do
  devise_for :users

  # Listings routes
  resources :listings
  get "/listings/:id/show_basic", to: "listings#show_basic", as: "show_basic"
  post "/listings/:id", to: "listings#create_purchase", as: "create_purchase"

  # Homepage route
  get "/", to: "pages#home", as: "root"

  # Profile page routes
  get "/profile/:id", to: "profiles#index", as: "user"
  get "/profile/:id/show", to: "profiles#show", as: "user_show"
  put "/profile/:id", to: "profiles#edit"
  patch "/profile/:id", to: "profiles#edit"
  post "/profile/:id", to: "profiles#update"
  get "/profile/:id/edit", to: "profiles#edit", as: "edit_profile"

  # Dashboard routes 
  get "/dashboard/pending_listings/", to: "dashboards#pending_listings_index", as: "pending_listings"
  put "/dashboard/pending_listings/:id", to: "dashboards#pending_listings_update"
  patch "/dashboard/pending_listings/:id", to: "dashboards#pending_listings_update", as: "pending_listings_update"

  get "/dashboard/available_listings", to: "dashboards#available_listings_index", as: "available_listings"
  delete "/dashboard/available_listings/:id", to: "dashboards#available_listings_destroy", as: "delete_available_listing"

  get "/dashboard/completed_listings", to: "dashboards#completed_listings_index", as: "completed_listings"
  get "/dashboard/current_purchase_orders", to: "dashboards#current_purchase_orders_index", as: "current_purchase_orders"

  get "/dashboard/purchase_history", to: "dashboards#purchase_history_index", as: "purchase_history"
  put "/dashboard/purchase_history/:id", to: "dashboards#user_feedback_update"
  patch "/dashboard/purchase_history/:id", to: "dashboards#user_feedback_update", as: "feedback_update"
end
