require 'spec_helper'

describe Address do
  subject { create :address }

  it { should respond_to :line1 }
  it { should respond_to :line2 }
  it { should respond_to :city }
  it { should respond_to :zip }
  it { should respond_to :state_code }
  it { should respond_to :country_code }
  it { should respond_to :province_code }
end
