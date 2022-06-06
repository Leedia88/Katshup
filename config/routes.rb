Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts , only: [:create, :edit, :show, :update, :destroy]
  resources :orders , only: [:create, :update]
  resources :products , only: [:index, :show]

end
