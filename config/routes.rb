Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :flights

  get '/user' => "flights#index", :as => :user_root
end
