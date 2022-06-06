class OrdersController < ApplicationController

    def def new  
    end
    

    def create   
    puts "#!" * 50
    @user = User.find(params[:user_id])
    @cart = @user.cart
    @products = @cart.get_products
    @stripe_amount = 1000

    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Payement de la commande",
      currency: 'eur',
      })
        rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_user_order_path(params[:user_id])
    end

    new_order = Order.create(user: @user)
    @products.each {|product| ProductOrder.create(order: new_order, product: product)}
    CartProduct.where(cart:@cart).destroy_all
    redirect_to user_path(@user)

    end

    def show
    end

end
