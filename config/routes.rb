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

  # Dashboard routes - not sure if any of these need dynamic routes - e.g. /dashboard/:id/pending_listings because they all rely on/only can be accessed by the signed in current user
  get "/dashboard/pending_listings/", to: "dashboards#pending_listings_index", as: "pending_listings"
  put "/dashboard/pending_listings/:id", to: "dashboards#pending_listings_update"
  patch "/dashboard/pending_listings/:id", to: "dashboards#pending_listings_update"
  # post "/dashboard/pending_listings", to: "dashboards#pending_listings_update"

  get "/dashboard/current_listings", to: "dashboards#current_listings_index", as: "current_listings"
  get "/dashboard/completed_listings", to: "dashboards#completed_listings_index", as: "completed_listings"
  get "/dashboard/current_purchase_orders", to: "dashboards#current_purchase_orders_index", as: "current_purchase_orders"
  get "/dashboard/purchase_history", to: "dashboards#purchase_history_index", as: "purchase_history"
end
