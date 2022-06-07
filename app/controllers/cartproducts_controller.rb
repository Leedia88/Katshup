class CartproductsController < ApplicationController
    before_action :authenticate_user!

    def create
        @product = Product.find(params[:product])
        CartProduct.create!(product: @product, cart: current_user.cart)
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js
        end
    end

    def destroy
        @cart_product = CartProduct.find(params[:id])
        @cart_product.destroy 
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js
        end 
    end

end
