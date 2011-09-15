class Guest < ActiveRecord::Base
  SALUTATIONS = %w(Dr. Mr. Mrs. Miss Rev. Sir. Pastor Vicar The)

  named_scope :admin, :conditions => { :admin => true }
  named_scope :non_admin, :conditions => { :admin => false }

  # for all def self.whatever methods
  class << self
    # perform a special find for login info
    def find_for_login(last_name, pin)
      first(:conditions => ['guests.pin = ? and guests.last_name like ?', pin, last_name])
    end
  end

  def name=(names)
    first_name, last_name = names.split(' ', 2)
    if last_name.blank?
      self[:last_name] = first_name
    else
      self[:first_name], self[:last_name] = first_name, last_name
    end
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
end
