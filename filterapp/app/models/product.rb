class Product < ApplicationRecord

  # scope(:product_name, -> (name) { where("name like ?", "#{name}%")})
  # scope(:description, -> (description) { where("description like ?", "%#{description}%")})
  # scope(:price, -> (price) { where price: price })

  scope(:product_name, lambda {|prod_name| where("LOWER(name) like ?", "%#{prod_name.downcase}%")})
  # % means can be anything %before or after% or %both%
  scope(:description, lambda {|descript| where("LOWER(name) like ?", "%#{descript.downcase}%")})
  scope(:description, lambda {|prod_price| where(price: prod_price)})




end
