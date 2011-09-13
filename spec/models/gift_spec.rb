require 'spec_helper'

describe Gift do
  subject { create :gift }

  it { should respond_to :gift }
  it { should respond_to :description }
  it { should respond_to :notes }
end
