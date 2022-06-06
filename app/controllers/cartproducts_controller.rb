class CartproductsController < ApplicationController
    before_action :authenticate_user!

    def create
        @product = Product.find(params[:id])
        CartProduct.create(product: @product, user: current_user)
    end

    def destroy

    end

end
