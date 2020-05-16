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
end
