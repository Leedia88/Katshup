class CartsController < ApplicationController

    def index
    end
    
    def create
    end

    def show
        @cart = current_user.cart
         @products = @cart.get_products
    end

    def edit 
    end

    def updated 
    end


end
