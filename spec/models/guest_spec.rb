require 'spec_helper'

describe Guest do
  before  { @guest = create(:guest) }
  subject { @guest }

  # accepts_nested_attributes_for :address, :gift, :rsvp
  it { should respond_to :address_attributes= }
  it { should respond_to :gift_attributes= }
  it { should respond_to :rsvp_attributes= }

  it { should validate_presence_of :last_name }

  it { should respond_to :honorific }
  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :name_suffix }
  it { should respond_to :additional_names }
  it { should respond_to :email }

  it { should respond_to :name }
  its(:name) { should == "#{@guest.first_name} #{@guest.last_name}" }
end
