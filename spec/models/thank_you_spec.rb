require 'spec_helper'

describe ThankYou do
  subject { create :thank_you }

  it { should respond_to :note }
end
