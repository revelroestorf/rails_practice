class Book < ApplicationRecord

  resourcify

  belongs_to :author

  # scope(:product_name, lambda {|prod_name| where("LOWER(name) like ?", "%#{prod_name.downcase}%")})

  scope(:title, lambda {|tit| where("title like ?", "%#{tit}%")})
  scope(:rating, lambda {|r| where(rating: r)})
  scope(:min_price, lambda {|minp| where("price > ?", minp)})
  scope(:max_price, lambda {|maxp| where("price < ?", maxp)})



end
