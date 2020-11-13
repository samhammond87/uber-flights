Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :flights do
    resources :comments
  end

  get '/user' => "flights#index", :as => :user_root
end
