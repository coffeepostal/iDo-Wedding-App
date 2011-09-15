class Address < ActiveRecord::Base
  belongs_to :guest

  validates :line1, :city, :presence => true
end
