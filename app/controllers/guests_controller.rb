class GuestsController < ApplicationController
  before_filter :require_guest
  before_filter :require_admin, :only => [:index, :new, :create, :destroy]
  
  def index
    @guests = Guest.all
  end
  
  def show
    # @guest from require_guest filter
    @admin_guest = Guest.find(params[:id]) if admin? && params.key?(:id)
  end

  def new
    @new_guest = Guest.new
  end
  
  def create
    @new_guest = Guest.new(params[:guest])
    if @new_guest.save
      flash[:notive] = 'Guest was successfully created.'
      redirect_to admin_guest_path(@new_guest)
    else
      render :new
    end
  end

  def edit
    # @guest from require_guest filter
    @admin_guest = Guest.find(params[:id]) if admin? && params.key?(:id)
  end

  def update
    have_admin_guest = admin? && params.key?(:id)
    guest = have_admin_guest ? Guest.find(params[:id]) : @guest
    
    if guest.update_attributes(params[:guest])
      flash[:notice] = 'Guest was successfully updated.'
      redirect_to have_admin_guest ? admin_guest_path(guest) : guest_path
    else
      render :edit
    end
  end
  
  def destroy
    # @guest from require_guest filter
    @admin_guest = Guest.find(params[:id])
    @admin_guest.destroy
    redirect_to admin_guests_path
  end
end