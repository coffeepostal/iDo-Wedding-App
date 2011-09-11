require 'spec_helper'

describe AddressesController do
  describe "GET 'new'" do
    before { get :new, :guest_id => 1 }

    its(:response) { should be_success }
  end

  describe "POST 'create'" do
    before { post :create, :guest_id => 1 }

    its(:response) { should redirect_to('/guests/1/address') }
  end

  describe "GET 'edit'" do
    before { get :edit, :guest_id => 1 }

    its(:response) { should be_success }
  end

  describe "PUT 'update'" do
    before { put :update, :guest_id => 1 }

    its(:response) { should redirect_to('/guests/1/address') }
  end

  describe "DELETE 'destroy'" do
    before { delete :destroy, :guest_id => 1 }

    its(:response) { should redirect_to('/guests/1') }
  end
end
