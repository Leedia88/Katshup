class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :products, through: :product_orders

  def send_confirmation_mail
    UserMailer.confirm_purchase(self).deliver_now
  end

  def get_products
    list = []
    ProductOrder.where(order: self).each do |po|
      list << Product.find(po.product_id)
    end
    return list
    
  end



end
