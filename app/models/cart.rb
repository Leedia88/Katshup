class Cart < ApplicationRecord
  
  belongs_to :user
  has_many :cart_products 
  has_many :products, through: :cart_products

  def get_products
     list = []
    CartProduct.where(cart: self).each do |cp|
      list << Product.find(cp.product_id)
    end
    puts list
    return list
    
  end

  def get_total

  end

end
