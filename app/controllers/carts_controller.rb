class CartsController < ApplicationController

    #creation simultanée avec création user
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

    #destroy avec user

end
