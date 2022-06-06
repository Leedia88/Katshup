class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :show]

    def index
        @products = Product.all.order(:id)
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

end
