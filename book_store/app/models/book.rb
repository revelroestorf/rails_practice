class Book < ApplicationRecord

  resourcify
  
  belongs_to :author
end
