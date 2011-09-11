class Guest < ActiveRecord::Base
  with_options :dependent => :destroy do |guest|
    guest.has_one :address
    guest.has_one :gift
    guest.has_one :rsvp
  end
  has_one :thank_you, :through => :gift

  validates :last_name, :presence => true

  before_create :generate_pin

private

  # generate a PIN for this guest record
  def generate_pin
    # don't do anything if this record already has a 4-digit PIN
    return if self.pin =~ /^\d{4}$/
    # create a random, unique 4-digit PIN
    begin
      pin_value = Array.new(4) { rand(10) }.join
    end while self.class.exists?(:pin => pin_value)
    self.pin = pin_value
  end
end
