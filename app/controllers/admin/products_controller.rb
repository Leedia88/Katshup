class Admin::ProductsController < ApplicationController
    before_action :require_admin
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @active_products = Product.where(available: true)
        @archived_products = Product.where(available: false)
    end

    def new
        @product = Product.new
        @categories = Category.all
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            params[:cats_id].each do |id|
                ProductCategory.create(product: @product, category_id: id)
            end
            redirect_to admin_product_path(@product)
        else
            flash[:danger] = "Error while saving."
            render new
        end
    end

    def edit
        @categories = Category.all
    end

    def show
    end

    def update
        if params[:available]
            @product.update(available: params[:available])
            redirect_to admin_products_path
        else
            @product.update(product_params)
            flash[:success] = "Product was successfully updated."
            redirect_to admin_product_path
        end
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