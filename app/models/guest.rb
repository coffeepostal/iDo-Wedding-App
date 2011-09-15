class Guest < ActiveRecord::Base
  with_options :dependent => :destroy do |guest|
    guest.has_one :address
    guest.has_one :gift
    guest.has_one :rsvp
  end
  has_one :thank_you, :through => :gift

  accepts_nested_attributes_for :address, :gift, :rsvp, :reject_if => :all_blank

  validates :last_name, :presence => true
  validates_associated :address
  validates_associated :gift
  validates_associated :rsvp

  before_create :generate_pin

  def name
    return nil if [first_name, last_name].none?
    [first_name, last_name, name_suffix].reject(&:blank?).join(' ')
  end

private

  # generate a PIN for this guest record
  def generate_pin
    # don't do anything if this record already has a 4-digit PIN
    return if self.pin =~ /^\d{4}$/
    # create a random, unique 4-digit PIN
    begin pin = Array.new(4) { rand(10) }.join end while self.class.exists?(:pin => pin)
    self.pin = pin
  end
end
