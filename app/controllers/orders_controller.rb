class OrdersController < ApplicationController
  before_action :set_user_and_cart, only: %i[ new create show ]

  def new
    @cart = @user.cart
    @products = @cart.get_products
    @stripe_amount = (@cart.total_amount*100).to_i
  end
  

  def create  
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
  new_order.add_to_order(@products)
  @cart.empty_cart
  new_order.send_confirmation_mail

  redirect_to user_order_path(@user.id, new_order.id, amount: @stripe_amount/100)

  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def set_user_and_cart
      @user = User.find(params[:user_id])
      @cart = @user.cart
    end

end
