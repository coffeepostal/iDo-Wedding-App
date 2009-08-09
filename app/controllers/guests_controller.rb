class GuestsController < ApplicationController
  before_filter :require_session_guest
  
  def show
    # @session_guest
  end

  def edit
    # @session_guest
  end

  def update
    # @session_guest
    if @session_guest.update_attributes(params[:guest])
      flash[:notice] = 'You information has been updated! Thank you.'
      redirect_to guest_path
    else
      render :edit
    end
  end

end