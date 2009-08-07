class Address < ActiveRecord::Base
  belongs_to :guest
  
  COUNTRY_OPTIONS = ['United States', 'Canada', 'Italy']
  
  # Validating the address form fields aren't empty.
  validates_presence_of :line_1, :city
  validates_inclusion_of :country, :in => COUNTRY_OPTIONS
  
  # United States Address:
  # Dallas Reedy
  # 214 S 1st Ave.
  # Walla Walla, WA 99362
  validates_inclusion_of :state, :in => UnitedStatesStates::MAP.values, :if => lambda{|a| a.country == 'United States'}
  validates_format_of :zip, :with => /^\d{5}(?:\-\d{4})?$/, :if => lambda{|a| a.country == 'United States'}
  
  # Canadian Address:
  # JOHN JONES
  # 10–123 MAIN STREET NW       # 10 is the unit number (e.g. apartment)
  # MONTREAL QC H3Z 2Y7         # QC is the province abbreviation
  # CANADA
  validates_inclusion_of :province, :in => CanadianProvinces::MAP.values, :if => lambda{|a| a.country == 'Canada'}
  validates_format_of :zip, :with => /^[A-Z0-9]{3} [A-Z0-9]{3}$/, :if => lambda{|a| a.country == 'Canada'}
  
  # Italian Address:
  # Mario Rossi
  # Via Rio 7                   # 7 is the address number
  # 30030 Martellago (VE)       # (VE) is the province abbreviation
  # Italy
  validates_inclusion_of :province, :in => ItalianProvinces::MAP.values, :if => lambda{|a| a.country == 'Italy'}
  validates_format_of :zip, :with => /^\d{5}$/, :if => lambda{|a| a.country == 'Italy'}
  
  def lines
    [[guest.try(:full_name), additional_names].compact.to_sentence(:two_words_connector => ' & '), line_1, line_2, "#{city}, #{state} #{zip}"]
  end
  
  def to_s
    lines.compact.join(', ')
  end
end