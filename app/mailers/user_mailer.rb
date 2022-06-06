class UserMailer < ApplicationMailer
  default from: 'no_reply-katshup@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://katshup.fr/login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end