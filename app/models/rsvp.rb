class Rsvp < ActiveRecord::Base
  belongs_to :guest

  validates :number_attending, :presence => { :if => :attending? }
  validates :number_attending, :numericality => {
    :allow_nil              => true,
    :greater_than           => 0,
    :if                     => :attending?,
    :less_than_or_equal_to  => :max_number_attending,
    :only_integer           => true }
end
