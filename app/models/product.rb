class Product < ApplicationRecord
  has_many :product_categories  
  has_many :categories, through: :product_categories
  has_many :evaluations
  has_many :product_orders
  has_many :orders, through: :product_orders
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_one_attached :image, dependent: :destroy

  validates :price, presence: true

  def product_grade 
    grade = 0
      self.evaluations.each do |evaluation|
        grade += evaluation.grade 
      end
    grade == 0 ? (return grade) : (return grade/self.evaluations.size)
  end

  def purchased_by(user)
    user.orders.each do |order|
      if ProductOrder.find_by(order: order, product: self)
        return true
      end
    end
    return false
  end

  def categories_list
    list =[]
    self.categories.each do |cat|
      list << cat.name
    end
    list.join(" ")
  end

end
