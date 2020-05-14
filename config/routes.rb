Rails.application.routes.draw do
  devise_for :users

  resources :listings

  get "/", to: "pages#home", as: "root"
end
