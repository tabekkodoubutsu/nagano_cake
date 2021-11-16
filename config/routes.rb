Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root "homes#top"
    resources :items, only: [:index, :create, :new, :edit, :show, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:edit, :show, :update, :destroy]
    resources :orders, only: [:index, :show]
    resources :order_details, only: [:update]
  end
  
  namespace :public do
    root "homes#top"
    get "/about" => "homes#about"
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :customers, only: [:show, :edit, :update]
    get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw", as: "withdraw"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "/cart_items" => "cart_items#all_destroy", as: "cart_items_all_destroy"
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :addresses, only: [:index, :edit ,:create, :update, :destroy]
  end  
      
end
