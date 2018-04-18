class Store < ApplicationRecord

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{address}, #{city}, #{state}, #{postcode}, #{country}"
  end


end
