class AddressesController < ApplicationController
  def new
  end

  def create
    redirect_to guest_address_path(1)
  end

  def edit
  end

  def update
    redirect_to guest_address_path(1)
  end

  def destroy
    redirect_to guest_path(1)
  end
end
