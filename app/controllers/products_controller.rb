class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :show]

    def index
        @products = Product.all.order(:id)
    end

    def edit
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

end
