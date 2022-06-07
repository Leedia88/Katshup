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

  def notif_purchase(order)
    @order = order
    @admins = User.where(is_admin: true)
    emails = @admins.collect(&:email).join(",")
    @product_list = @order.get_products
    @url  = 'https://katshup.herokuapp.com/' 
    mail(to: emails, subject: 'Nouvelle commande réalisée sur Katshup!')
  end

end