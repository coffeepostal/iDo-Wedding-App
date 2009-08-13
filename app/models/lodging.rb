class Lodging < Struct.new(:name, :street, :city, :state, :zip, :phone, :url)
  
  CITY  = 'Bellingham'
  STATE = 'WA'
  ZIP   = '98225'
  
  LODGINGS = [
    ['Fairhaven Village Inn',     '1200 10th St',       CITY, STATE, ZIP,     360_733_1311,
      'http://www.fairhavenvillageinn.com/'],
    
    ['Chrysalis Inn and Spa',     '804 10th St',        CITY, STATE, ZIP,     360_756_1005,
      'http://www.thechrysalisinn.com/'],
    
    ['Days Inn',                  '215 Samish Way',     CITY, STATE, ZIP,     360_734_8830,
      'http://www.daysinn.com/DaysInn/control/Booking/property_info?propertyId=00996&as_srp=SP2&cid=carat_search-Days_Inn'],
    
    ['Best Western Lakeway Inn',  '714 Lakeway Drive',  CITY, STATE, '98229', 360_671_1011,
      'http://www.thelakewayinn.com'],
    
    ['Best Western Heritage Inn', '151 E McLeod Rd',    CITY, STATE, '98226', 360_647_1912,
      'http://www.bestwesternwashington.com/hotels/best-western-heritage-inn/'],

    ['Coachman Inn',              '120 N Samish Way',   CITY, STATE, ZIP,     360_671_9000,
      'http://www.coachmaninnmotel.com'],

    ['Motel 6',                   '3701 Byron Avenue',  CITY, STATE, ZIP,     360_671_4494,
      'http://www.motel6.com/reservations/motel_detail.aspx?num=0044']
  ]
  
  class << self
    def all
      LODGINGS.map do |lodging|
        self.new(*lodging)
      end
    end
    
    def first
      self.new(*LODGINGS.first)
    end
    
    def last
      self.new(*LODGINGS.last)
    end
    
    def find(*index_or_array_of_indices)
      return nil unless index_or_array_of_indices.all? {|i| i.is_a?(Integer)}
      index_or_array_of_indices.map {|i| i - 1}
      
      if index_or_array_of_indices.length == 1
        return nil unless included?(index_or_array_of_indices.first)
        self.new(*LODGINGS[index_or_array_of_indices.first - 1])
      else
        lodgings = []
        index_or_array_of_indices.each do |index|
          return nil unless included?(index)
          lodgings << self.new(*LODGINGS[index])
        end
        lodgings
      end
    end
    
    private
    
    def included?(index)
      (0..(LODGINGS.length - 1)).include?(index)
    end
  end
  
  def blank?
    values.all?(&:blank?)
  end

end