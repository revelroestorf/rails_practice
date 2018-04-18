class Contact < ApplicationRecord

  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode   # auto-fetch coordinates

  def full_address
    "#{street}, #{city}, #{state}, #{postcode}"
  end
end
