require 'spec_helper'

describe Guest do
  before  { @guest = create(:guest) }
  subject { @guest }

  # Generated Guest should be valid
  it { should be_valid }

  # accepts_nested_attributes_for :address, :gift, :rsvp
  it { should respond_to :address_attributes= }
  it { should respond_to :gift_attributes= }
  it { should respond_to :rsvp_attributes= }

  # Validations
  it { should validate_presence_of :last_name }

  # Validations for associations
  context 'when associated address is invalid' do
    before { @guest.build_address(attributes_for(:address, :city => nil)) }
    it { should_not be_valid }
  end

  context 'when associated address is valid' do
    before { @guest.build_address(attributes_for(:address)) }
    it { should be_valid }
  end

  context 'when associated rsvp is invalid' do
    before {
      @guest.build_rsvp(:attending => true, :max_number_attending => 2, :number_attending => 3)
    }
    it { should_not be_valid }
  end

  context 'when associated rsvp is valid' do
    before { @guest.build_rsvp(attributes_for(:rsvp, :attending => true)) }
    it { should be_valid }
  end

  # Attributes
  it { should respond_to :honorific }
  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :name_suffix }
  it { should respond_to :additional_names }
  it { should respond_to :email }

  # Methods
  it { should respond_to :name }

  context 'when there is no name_suffix' do
    before { @guest.name_suffix = nil }
    its(:name) { should == "#{@guest.first_name} #{@guest.last_name}" }

    context 'and no first_name' do
      before { @guest.first_name = nil }
      its(:name) { should == @guest.last_name }
    end

    context 'and no last_name' do
      before { @guest.last_name = nil }
      its(:name) { should == @guest.first_name }
    end

    context 'and no first_name or last_name' do
      before { @guest.first_name = @guest.last_name = nil }
      its(:name) { should be_nil }
    end
  end

  context 'when there is a name_suffix' do
    before { @guest.name_suffix = 'Jr.' }
    its(:name) { should == "#{@guest.first_name} #{@guest.last_name} Jr." }

    context 'but there is no first_name' do
      before { @guest.first_name = nil }
      its(:name) { should == "#{@guest.last_name} Jr." }
    end

    context 'but there is no last_name' do
      before { @guest.last_name = nil }
      its(:name) { should == "#{@guest.first_name} Jr." }
    end

    context 'but there is no first_name nor last_name' do
      before { @guest.first_name = @guest.last_name = nil }
      its(:name) { should be_nil }
    end
  end
end
