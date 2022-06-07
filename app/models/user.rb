class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create  :set_cart, :welcome_send

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_many :orders

  def set_cart
    Cart.create!(user: self)
    # redirect_to root_path
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
