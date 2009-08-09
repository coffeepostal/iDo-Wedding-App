class ThankYou < ActiveRecord::Base
  belongs_to :gift
  
  validates_presence_of :note
end
