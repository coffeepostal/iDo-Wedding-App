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
  it { should respond_to :name? }

  describe '#name?' do
    subject { @guest.name? }

    context 'when it does not have a first_name' do
      before { @guest.first_name = nil }
      it { should be_true }
    end

    context 'when it does not have a last_name' do
      before { @guest.last_name = nil }
      it { should be_true }
    end

    context 'when it does not have a first_name or a last_name' do
      before { @guest.first_name = @guest.last_name = nil }
      it { should be_false }
    end
  end

  it { should respond_to :name }

  describe '#name' do
    subject { @guest.name}

    context 'when it does not have a first_name' do
      before { @guest.first_name = nil }
      it { should == @guest.last_name }
    end

    context 'when it does not have a last_name' do
      before { @guest.last_name = nil }
      it { should == @guest.first_name }
    end

    context 'when it does not have a first_name or a last_name' do
      before { @guest.first_name = @guest.last_name = nil }
      it { should be_nil }
    end
  end

  it { should respond_to :name_with_honorific }

  describe '#name_with_honorific' do
    subject { @guest.name_with_honorific }

    context 'when it has a name' do
      context 'and it has an honorific' do
        before { @guest.honorific = 'Dr.' }
        it { should == "Dr. #{@guest.name}" }
      end

      context 'but it does not have an honorific' do
        before { @guest.honorific = nil }
        it { should == @guest.name }
      end
    end

    context 'when it does not have a name' do
      before { @guest.first_name = @guest.last_name = nil }

      context 'and it does not have an honorific' do
        before { @guest.honorific = nil }
        it { should be_nil }
      end

      context 'but it does have an honorific' do
        before { @guest.honorific = 'Rev.' }
        it { should be_nil }
      end
    end
  end

  it { should respond_to :name_with_suffix }

  describe '#name_with_suffix' do
    subject { @guest.name_with_suffix }

    context 'when it has a name' do
      context 'and it has a name_suffix' do
        before { @guest.name_suffix = 'Jr.' }
        it { should == "#{@guest.name} Jr." }
      end

      context 'but it does not have a name_suffix' do
        before { @guest.name_suffix = nil }
        it { should == @guest.name }
      end
    end

    context 'when it does not have a name' do
      before { @guest.first_name = @guest.last_name = nil }

      context 'and it does not have a name_suffix' do
        before { @guest.name_suffix = nil }
        it { should be_nil }
      end

      context 'but it does have a name_suffix' do
        before { @guest.name_suffix = 'Sr.' }
        it { should be_nil }
      end
    end
  end

  it { should respond_to :name_with_honorific_and_suffix }

  describe '#name_with_honorific_and_suffix' do
    subject { @guest.name_with_honorific_and_suffix }

    context 'when it has a name' do
      context 'and an honorific and a name_suffix' do
        before { @guest.honorific = 'Mr.'; @guest.name_suffix = 'III' }
        it { should == "Mr. #{@guest.name} III" }
      end

      context 'and an honorific but not a name_suffix' do
        before { @guest.honorific = 'Mrs.'; @guest.name_suffix = nil }
        it { should == "Mrs. #{@guest.name}" }
      end

      context 'and a name_suffix but not an honorific' do
        before { @guest.honorific = nil; @guest.name_suffix = 'DDS' }
        it { should == "#{@guest.name} DDS" }
      end

      context 'but not an honorific nor a name_suffix' do
        before { @guest.honorific = @guest.name_suffix = nil }
        it { should == @guest.name }
      end
    end

    context 'when it does not have a name' do
      before { @guest.first_name = @guest.last_name = nil }

      context 'but does have an honorific and a name_suffix' do
        before { @guest.honorific = 'Miss'; @guest.name_suffix = 'PhD' }
        it { should be_nil }
      end

      context 'nor a name_suffix but does have an honorific' do
        before { @guest.honorific = 'Sir'; @guest.name_suffix = nil }
        it { should be_nil }
      end

      context 'nor an honorific but does have a name_suffix' do
        before { @guest.honorific = nil; @guest.name_suffix = 'IV' }
        it { should be_nil }
      end

      context 'or an honorific or a name_suffix' do
        before { @guest.honorific = @guest.name_suffix = nil }
        it { should be_nil }
      end
    end
  end
end
