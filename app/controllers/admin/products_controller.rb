class Admin::ProductsController < ApplicationController
    before_action :require_admin
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all.order(:id)
    end

    def edit
    end

    def show
    end

    def update
        @product.update(product_params)
        flash[:success] = "Product was successfully updated."
        redirect_to admin_products_path
    end

    def destroy
        @product.destroy
        flash[:success] = "Product was successfully deleted."
        redirect_to admin_products_path
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def require_admin
        unless current_user.is_admin
            puts "%" * 50 
            redirect_to root_path
        end
        puts "#" * 50
    end

    def product_params
        params.require(:product).permit(:title, :description, :price)
    end
end