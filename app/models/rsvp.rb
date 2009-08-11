class Rsvp < ActiveRecord::Base
  nullify :number_attending
  
  belongs_to :guest
  
  # don't allow some Hackety McHacker to raise (or lower) the number of people they can RSVP for
  attr_protected :max_number_attending
  
  validates_presence_of :number_attending, :if => lambda{|rsvp| rsvp.attending?}
  
  ATTENDING_MAP = { true => 'yes', false => 'no' }
  
  def attending_response
    ATTENDING_MAP[self[:attending]] || self[:attending]
  end
  
  def one?
    number_attending == 1
  end
  
  def two?
    number_attending == 2
  end
  
  def max?
    number_attending == max_number_attending
  end
end
