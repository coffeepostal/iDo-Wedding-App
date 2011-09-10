class AddressesController < ApplicationController
  before_filter :require_admin_user
  before_filter :load_guest, :except => :index
  before_filter :load_guest_address, :except => [:index, :new, :create]
  
  def index
    @guests = Guest.all(:include => :address)
  end
  
  def show
    # @guest
    # @address
  end
  
  def new
    # @guest
    @address = @guest.build_address
  end
  
  def create
    # @guest
    @address = @guest.create_address(params[:address])
    if @address.valid?
      flash[:notice] = 'Address was successfully created.'
      redirect_to admin_guest_path(@guest)
    else
      render :new
    end
  end
  
  def edit
    # @guest
    # @address
  end
  
  def update
    # @guest
    # @address
    if @address.update_attributes(params[:address])
      flash[:notice] = 'Address was successfully updated.'
      redirect_to admin_guest_path(@guest)
    else
      render :edit
    end
  end
  
  def destroy
    # @guest
    # @address
    @address.destroy
    redirect_to admin_guest_path(@guest)
  end
  
  private
  
  def load_guest_address
    # @guest
    @address = @guest.address
  end
end
