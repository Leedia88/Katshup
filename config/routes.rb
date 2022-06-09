Rails.application.routes.draw do
  get 'evaluations/create'
  get 'evaluations/update'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  resources :users do
    resources :carts, path: :panier do 
      resources :cartproducts
    end
    resources :avatars, only: [:create]
    resources :orders , only: [:new, :create, :update, :show]
  end

  resources :products , only: [:index, :show, :edit] do
    resources :images, only: [:create]
    resources :evaluations, only: [:create]
  end

  namespace :admin do
    resources :products, :except => [ :destroy]
    resources :orders
  end
  
end