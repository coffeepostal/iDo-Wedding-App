class Address < ActiveRecord::Base
  belongs_to :guest
  
  COUNTRY_OPTIONS = [nil, 'Canada', 'Italy']
  
  # Validating the address form fields aren't empty.
  validates_presence_of :line_1, :city, :state, :zip
  
  def lines
    [line_1, line_2, "#{city}, #{state} #{zip}"]
  end
  
  def to_s
    lines.compact.join(', ')
  end
end