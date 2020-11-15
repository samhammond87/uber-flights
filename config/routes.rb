Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users

  resources :users do
    resources :orders, :only => [:index, :show, :create]
  end

  resources :flights do
    resources :comments
  end

  # resources :orders, :only => [:index, :show, :create]

  get '/user' => "flights#index", :as => :user_root


  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
end
