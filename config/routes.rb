Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users
  root to: "home#index"
  
  resources :users, :flights

  get '/user' => "flights#index", :as => :user_root
end
