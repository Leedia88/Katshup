class CartproductsController < ApplicationController
    before_action :authenticate_user!

    def create
        @product = Product.find(params[:product_id])
        CartProduct.create!(product: @product, cart: current_user.cart)
        puts "j'ai ajouté un cartproduct"
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js
        end
    end

    def destroy
        @product = Product.find(params[:product_id])
        @product.destroy 
            redirect_to product_cartproduct_path
    end

end
