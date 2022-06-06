class CartproductsController < ApplicationController
    before_action :authenticate_user!

    def create
        @product = Product.find(params[:product])
        CartProduct.create!(product: @product, cart: current_user.cart)
        puts "j'ai ajouté un cartproduct"
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js
        end
    end

    def destroy
        @cart_product = CartProduct.find(params[:id])
        @cart = @cart_product.cart
        @cart_product.destroy 
        redirect_to user_cart_path(@cart)
    end

end
