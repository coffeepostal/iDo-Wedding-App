class Guest < ActiveRecord::Base
  with_options :dependent => :destroy do |guest|
    guest.has_one :address
    guest.has_one :gift
    guest.has_one :rsvp, :class_name => 'RSVP'
  end
  has_one :thank_you, :through => :gift
end
