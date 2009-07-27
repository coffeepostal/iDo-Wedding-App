class Guest < ActiveRecord::Base
  
  has_one :address
  has_one :gift
  has_one :rsvp
  
  # Validating the guest form fields aren't empty.
  validates_presence_of :name, :email
  validates_associated :address

  def name
    [first_name, last_name].compact.join(' ')
  end

  def name=(names)
    self[:first_name], self[:last_name] = names.split(' ', 2)
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
end