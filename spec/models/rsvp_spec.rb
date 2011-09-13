require 'spec_helper'

describe Rsvp do
  subject { create :rsvp }

  it { should respond_to :attending }
  it { should respond_to :max_number_attending }
  it { should respond_to :number_attending }
  it { should respond_to :group_rsvp }
  it { should respond_to :admin_rsvp }
end
