class CartsController < ApplicationController
    def show
        @cart = current_user.cart
         @products = @cart.get_products
    end

end
