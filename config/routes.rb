Rails.application.routes.draw do
  root to: "home#index"
  resources :carts
  # resources :orders
  resources :flights do
    resources :comments
    resources :carts, only: [:create]
  end
  
  devise_for :users




  # resources :orders, :only => [:index, :show, :create]

  get '/user' => "flights#index", :as => :user_root

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
end
