class AdminGuestsController < ApplicationController
  before_filter :require_admin
  
  def index
    @admin_guests = Guest.non_admin.all
  end
  
  def new
    @admin_guest = Guest.new
  end
  
  def create
    @admin_guest = Guest.new(params[:guest])

    if @admin_guest.save
      flash[:notice] = 'Guest was successfully created.'
      redirect_to admin_guests_path
    else
      render :new
    end
  end
  
  def edit
    @admin_guest = Guest.find(params[:id])
  end
  
  def update
    @admin_guest = Guest.find(params[:id])
    if @admin_guest.update_attributes(params[:admin_guest])
      flash[:notice] = 'Guest was successfully updated.'
      redirect_to admin_guests_path
    else
      render :edit
    end
  end
  
  def destroy
    @admin_guest = Guest.find(params[:id])
    @admin_guest.destroy
    redirect_to admin_guests_path
  end
end
