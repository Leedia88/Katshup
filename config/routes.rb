Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  resources :users do
    resources :carts, path: :panier do 
      resources :cartproducts
    end
    resources :orders , only: [:new, :create, :update]
  end
  
  resources :products , only: [:index, :show] 
end