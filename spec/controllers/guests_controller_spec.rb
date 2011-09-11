require 'spec_helper'

describe GuestsController do
  describe "GET 'index'" do
    before  { 5.times { create(:guest) } }
    before  { get :index }

    it { should assign_to :guests }
    its(:response) { should be_success }
  end

  describe "GET 'new'" do
    before { get :new }

    it { should assign_to(:guest).with_kind_of(Guest) }
    specify { assigns(:guest).should be_a_new_record }
    its(:response) { should be_success }
  end

  describe "POST 'create'" do
    before { post :create, :guest => attributes_for(:guest) }
    before { @guest = Guest.order('id DESC').first }

    it { should assign_to(:guest).with(@guest) }
    specify { assigns(:guest).should_not be_a_new_record }
    its(:response) { should redirect_to(@guest) }
  end

  context 'with a @guest' do
    before  { @guest = create(:guest) }

    describe "GET 'show'" do
      before  { get :show, :id => @guest.id }

      it { should assign_to(:guest).with(@guest) }
      specify { assigns(:guest).should_not be_a_new_record }
      its(:response) { should be_success }
    end

    describe "GET 'edit'" do
      before { get :edit, :id => @guest.id }

      it { should assign_to(:guest).with(@guest) }
      specify { assigns(:guest).should_not be_a_new_record }
      its(:response) { should be_success }
    end

    describe "PUT 'update'" do
      before { put :update, :id => @guest.id, :guest => attributes_for(:guest) }
      before { @guest = Guest.find(@guest.id) }

      it { should assign_to(:guest).with(@guest) }
      specify { assigns(:guest).should_not be_a_new_record }
      its(:response) { should redirect_to(@guest) }
    end
  end

  describe "DELETE 'destroy'" do
    before  { @guest = create(:guest) }
    before  { delete 'destroy', :id => @guest.id }
    subject { response }

    it { should redirect_to(:guests) }
  end
end
