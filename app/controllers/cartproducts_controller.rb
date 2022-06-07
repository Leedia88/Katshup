class CartproductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product

    def create
        CartProduct.create!(product: @product, cart: current_user.cart)
        respond_to do |format|
            format.html {redirect_to root_path}
            format.js {}
        end
    end

    def destroy
        @cart_product = CartProduct.find_by(cart: Cart.find(params[:cart_id]), product: Product.find(params[:product]))
        @cart = @cart_product.cart
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

    private 
    def set_product
        @product = Product.find(params[:product])
    end

end
