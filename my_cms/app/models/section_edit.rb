class SectionEdit < ApplicationRecord

  belongs_to :admin_user
  belongs_to :section
  has_many :admin_users, :through => :section_edits

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order('position') }
  scope :newest_first, lambda { order('created_at DESC') }
  scope :search, lambda { |query| where(['name LIKE ?', "%#{query}%"]) }


end
