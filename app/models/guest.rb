class Guest < ActiveRecord::Base
  has_one :address
  has_one :gift
  has_one :rsvp, :class_name => 'RSVP'
  has_one :thank_you, :through => :gift
end
