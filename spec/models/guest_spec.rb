require 'spec_helper'

describe Guest do
  before  { @guest = create(:guest) }
  subject { @guest }

  it { should respond_to :honorific }
  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :name_suffix }
  it { should respond_to :additional_names }
  it { should respond_to :email }
end
