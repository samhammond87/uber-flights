Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :flights do
    resources :comments
  end

  get '/user' => "flights#index", :as => :user_root

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
end
