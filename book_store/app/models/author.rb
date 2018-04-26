class Author < ApplicationRecord

  resourcify

  has_many :books

  scope(:author, lambda {|a| where("last_name like ?", "%#{a}%")})
  

  def name
    "#{first_name} #{last_name}"
  end

end
