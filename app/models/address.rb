class Address < ActiveRecord::Base
  belongs_to :guest
  
  # Validating the address form fields aren't empty.
  validates_presence_of :line_1, :city, :state, :zip
  
  def to_s
    [line_1, line_2, "#{city}, #{state} #{zip}"].compact.join('<br />')
  end
end