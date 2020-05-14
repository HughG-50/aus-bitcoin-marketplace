Rails.application.routes.draw do
  devise_for :users

  # listings routes
  resources :listings

  # homepage route
  get "/", to: "pages#home", as: "root"

  # profile page routes
  get "/profile/:id", to: "profiles#show", as: "user"
  put "/profile/:id", to: "profiles#edit"
  patch "/profile/:id", to: "profiles#edit"
  post "/profile/:id", to: "profiles#update"
  get "/profile/:id/edit", to: "profiles#edit", as: "edit_profile"
end
