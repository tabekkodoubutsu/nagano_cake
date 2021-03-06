Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root "homes#top"
    resources :items, only: [:index, :create, :new, :edit, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:edit, :show, :update, :index]
    resources :orders, only: [:update, :show]
    resources :order_details, only: [:update]
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end

  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    get "/orders/thanks" => "orders#thanks"
    get "/customers/my_page" => "customers#show"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :customers, only: [:edit, :update]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "/cart_items" => "cart_items#all_destroy"
    get 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :addresses, only: [:index, :edit ,:create, :update, :destroy]
  end
 
end
