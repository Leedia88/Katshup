class Cart < ApplicationRecord
  
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def get_products
    list = []
    CartProduct.where(cart: self).each do |cp|
      list << Product.find(cp.product_id)
    end
    return list
    
  end

  def total_amount
    price = 0
    self.get_products.each{|product| price += product.price}
    return price
  end

  def get_cartproduct(product)
    CartProduct.find_by(product: product, cart: self)
  end

  def nb_product_in_cart(product)
    self.products.where(title: product.title).count
  end

  def empty_cart
    CartProduct.where(cart: self).destroy_all
  end

end
