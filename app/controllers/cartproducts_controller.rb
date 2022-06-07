class CartproductsController < ApplicationController
    before_action :authenticate_user!

    def create
        @product = Product.find(params[:product])
        CartProduct.create!(product: @product, cart: current_user.cart)
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js {}
        end
    end

    def destroy
        @cart_product = CartProduct.find_by(cart: Cart.find(params[:cart_id]), product: Product.find(params[:product]))
        @cart = @cart_product.cart
        puts "*" *50
        puts params
        puts "*" *50
        @product = Product.find(params[:product])
        @delete_scope = params[:delete_scope]
        if @delete_scope == "all"
            CartProduct.all.where(cart: @cart, product: Product.find(params[:product])).destroy_all
        else 
            @cart_product.destroy 
        end
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js
        end 
    end

end
