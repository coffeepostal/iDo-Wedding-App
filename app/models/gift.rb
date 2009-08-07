class Gift < ActiveRecord::Base
  belongs_to :guest
  has_one :thank_you
  
  validates_presence_of :guest_id
end
