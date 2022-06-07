class Admin::OrdersController < ApplicationController
    before_action :require_admin
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
        @orders = Order.all.order(:id)
    end

    def edit
    end

    def show
    end

    def update
        @order.update(order_params)
        flash[:success] = "Product was successfully updated."
        redirect_to admin_products_path
    end

    def destroy
        @order.destroy
        flash[:success] = "Event was successfully deleted."
        redirect_to admin_events_path
    end

    private

    def set_order
        @order = Product.find(params[:id])
    end

    def require_admin
        unless current_user.is_admin
            puts "%" * 50 
            redirect_to root_path
        end
        puts "#" * 50
    end

    def order_params
        params.require(:order).permit(:total_amount)
    end
end