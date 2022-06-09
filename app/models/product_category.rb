class ProductCategory < ApplicationRecord
  belongs_to :category
  belongs_to :product
  validates :product_id, uniqueness: { scope: :category_id}
end
