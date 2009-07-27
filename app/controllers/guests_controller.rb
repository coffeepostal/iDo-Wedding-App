class GuestsController < ApplicationController
  before_filter :require_guest
  
  def show
  end

  def edit
  end

  def update
    if @guest.update_attributes(params[:guest])
      flash[:notice] = 'Guest was successfully updated.'
      redirect_to guest_path
    else
      render :edit
    end
  end
end