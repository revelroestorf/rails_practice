class Product < ApplicationRecord
  has_many :carts

  validates :description, presence: true, uniqueness: true

end
