class GuestsController < ApplicationController
  before_filter :require_guest
  before_filter :require_admin, :only => [:index, :new, :create, :destroy]
  
  def index
    # grab all guests, except for ourself
    @guests = Guest.all - [@admin]
  end
  
  def show
    @guest = Guest.find(params[:id]) if @admin && params.key?(:id)
  end

  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      flash[:notive] = 'Guest was successfully created.'
      redirect_to admin_guest_path(@guest)
    else
      render :new
    end
  end

  def edit
    @guest = Guest.find(params[:id]) if @admin && params.key?(:id)
  end

  def update
    have_admin_guest = @admin && params.key?(:id)
    @guest = Guest.find(params[:id]) if have_admin_guest
    
    if @guest.update_attributes(params[:guest])
      flash[:notice] = 'Guest was successfully updated.'
      redirect_to have_admin_guest ? admin_guest_path(@guest) : guest_path
    else
      render :edit
    end
  end
  
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to admin_guests_path
  end
end