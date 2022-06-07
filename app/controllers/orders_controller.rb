class OrdersController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @cart = @user.cart
    @products = @cart.get_products
    @stripe_amount = (@cart.total_amount*100).to_i
  end
  

  def create   
  @user = User.find(params[:user_id])
  @cart = @user.cart
  @products = @cart.get_products
  @stripe_amount = (@cart.total_amount*100).to_i

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

  new_order = Order.create(user: @user, total_amount: @stripe_amount/100)
  @products.each {|product| ProductOrder.create(order: new_order, product: product)}
  CartProduct.where(cart:@cart).destroy_all
  new_order.send_confirmation_mail
  
  redirect_to user_order_path(@user.id, new_order.id, amount: @stripe_amount/100)

  end

  def show
    @user = User.find(params[:user_id])
    @order = Order.find(params[:id])
  end

end
