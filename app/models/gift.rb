class Gift < ActiveRecord::Base
  nullify :gift, :description
  
  belongs_to :guest
  has_one :thank_you
end
