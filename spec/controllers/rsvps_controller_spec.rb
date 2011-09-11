require 'spec_helper'

describe RsvpsController do
  describe "GET 'new'" do
    before { get :new, :guest_id => 1 }

    its(:response) { should be_success }
  end

  describe "GET 'edit'" do
    before { get :edit, :guest_id => 1 }

    its(:response) { should be_success }
  end
end
