class Guest < ActiveRecord::Base
  nullify :salutation, :first_name, :suffix, :additional_names, :email
  nullify :address, :gift, :rsvp
  
  with_options :dependent => :destroy do |g|
    g.has_one :address
    g.has_one :gift
    g.has_one :rsvp
  end
  
  # accept attributes for our address, gift, and RSVP via one form
  accepts_nested_attributes_for :address, :gift, :rsvp
  
  SALUTATIONS = %w(Dr. Mr. Mrs. Miss Rev. Sir. Pastor Vicar The)
  
  attr_protected :admin
  
  # Validating the guest form fields aren't empty.
  validates_presence_of :last_name
  # validates_presence_of :email, :unless => lambda {|guest| guest.admin?}
  validates_associated :address, :rsvp
  
  before_create :generate_pin

  named_scope :admin, :conditions => { :admin => true }
  named_scope :non_admin, :conditions => { :admin => false }

  # for all def self.whatever methods
  class << self
    
    # perform a special find for login info
    def find_for_login(last_name, pin)
      first(:conditions => ['guests.pin = ? and guests.last_name like ?', pin, last_name])
    end
    
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
  
  def full_name(guest_only = false)
    guest_full_name = [salutation, name, suffix].compact.join(' ').strip
    return guest_full_name if guest_only
    [guest_full_name, additional_names].compact.to_sentence(:two_words_connector => ' & ')
  end
  
  def safe_email
    return nil if email.nil?
    email.gsub('@', ' [at] ').gsub('.', ' [dot] ')
  end
  
  def has_rsvped?
    rsvp.present? && !rsvp.attending.nil?
  end
  
  def is_attending?
    has_rsvped? && rsvp.attending?
  end
  
  def has_address?
    address.present?
  end
  
  def has_gift?
    gift.present?
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
