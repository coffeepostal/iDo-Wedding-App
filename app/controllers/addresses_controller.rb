class AddressesController < ApplicationController
  before_filter :require_admin
  before_filter :load_guest, :except => :index
  
  def index
    
  end
  
  def show
    
  end
  
  def new
    @address = @guest.build_address
  end
  
  def create
    if @address = @guest.create_address(params[:address])
      flash[:notice] = 'Address was successfully created.'
      redirect_to admin_guest_path(@guest)
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def load_guest
    @guest = Guest.find(params[:guest_id])
  end
end
