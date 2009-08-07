class Rsvp < ActiveRecord::Base
  belongs_to :guest
  
  # don't allow some Hacky McHacker to raise (or lower) the number of people they can RSVP for
  attr_protected :max_number_attending
  
  ATTENDING_MAP = { nil => '', true => 'yes', false => 'no' }
  
  def attending
    ATTENDING_MAP[self[:attending]]
  end
  
  def attending=(value)
    return if value.blank?
    write_attribute(:attending, value) if [true, false].include?(value)
  end
end
