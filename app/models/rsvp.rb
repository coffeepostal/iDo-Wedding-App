class Rsvp < ActiveRecord::Base
  belongs_to :guest
  
  # don't allow some Hackety McHacker to raise (or lower) the number of people they can RSVP for
  attr_protected :max_number_attending
  
  ATTENDING_MAP = { true => 'yes', false => 'no' }
  
  def attending_response
    ATTENDING_MAP[self[:attending]] || self[:attending]
  end
end
