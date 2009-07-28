class Guest < ActiveRecord::Base
  has_one :address
  has_one :gift
  has_one :rsvp
  
  attr_protected :admin
  
  # Validating the guest form fields aren't empty.
  validates_presence_of :name
  validates_presence_of :email, :unless => lambda {|guest| guest.admin?}
  validates_associated :address
  
  before_create :generate_pin

  named_scope :admin, :conditions => { :admin => true }
  named_scope :non_admin, :conditions => { :admin => false }

  # for all def self.whatever methods
  class << self
    # check that a given PIN isn't already in use by another record
    def pin_exists?(pin)
      all.map(&:pin).include?(pin)
    end
  end

  def name
    [first_name, last_name].compact.join(' ')
  end

  def name=(names)
    self[:first_name], self[:last_name] = names.split(' ', 2)
  end
  
  def full_name
    [prefix, name].compact.join(' ')
  end

  def address=(address_params)
    build_address address_params
  end
  
  def gift=(gift_params)
    build_gift gift_params
  end
  
  def rsvp=(rsvp_params)
    build_rsvp rsvp_params
  end
  
  private
  
  # generate a PIN for this guest record
  def generate_pin
    return if read_attribute(:pin) =~ /^\d{4}$/  # don't do anything if this record already has a 4-digit PIN
    begin
      pin_value = Array.new(4) { (0..9).to_a.rand }.join  # create a random 4-digit number
    end while self.class.pin_exists?(pin_value)
    write_attribute(:pin, pin_value)
  end
end