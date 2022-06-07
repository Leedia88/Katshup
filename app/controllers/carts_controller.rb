class CartsController < ApplicationController
    before_action :authenticate_user, only: [:edit, :show, :update, :new]

    def show
        @cart = current_user.cart
        @products = @cart.products
    end

    def destroy 
        @cart = current_user.cart
        CartProduct.where(cart:@cart).destroy_all
    end

    private

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_user_registration_path 
      end
    end

end
