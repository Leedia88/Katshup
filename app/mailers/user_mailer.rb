class UserMailer < ApplicationMailer
  default from: 'no_reply-katshup@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://katshup.herokuapp.com/' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def confirm_purchase(order)
    @order = order
    @user = order.user
    @product_list = @order.get_products
    @url  = 'https://katshup.herokuapp.com/' 
    mail(to: @user.email, subject: 'Confirmation de commande !') 
  end

end