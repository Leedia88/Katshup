class Product < ApplicationRecord
    has_one :category
    has_many :product_orders
    has_many :orders, through: :product_orders
    has_many :cart_products
    has_many :carts, through: :cart_products
    has_one_attached :image, dependent: :destroy
end
