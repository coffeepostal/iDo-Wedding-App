class Gift < ActiveRecord::Base
  belongs_to :guest
  has_one :thank_you, :dependent => :destroy
end
