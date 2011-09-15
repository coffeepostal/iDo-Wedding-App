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

  def name?
    [first_name, last_name].any?
  end

  def name
    return nil unless name?
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def name_with_honorific
    return nil unless name?
    return name unless honorific?
    "#{honorific} #{name}"
  end

  def name_with_suffix
    return nil unless name?
    return name unless name_suffix?
    "#{name} #{name_suffix}"
  end

  def name_with_honorific_and_suffix
    return nil unless name?
    return name_with_honorific unless name_suffix?
    return name_with_suffix unless honorific?
    "#{honorific} #{name} #{name_suffix}"
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
