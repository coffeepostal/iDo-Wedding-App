class GuestsController < ApplicationController
  before_filter :require_session_guest
  
  def show
    # @session_guest
  end

  def edit
    # @session_guest
  end

  def update    
    # Just set the new attributes, but don't save them.
    @session_guest.attributes = params[:guest]
    # Update the rsvp.admin_rsvp value if the rsvp.attending value has changed.
    @session_guest.rsvp.admin_rsvp = false if @session_guest.rsvp && @session_guest.rsvp.changed.include?('attending')
    
    if @session_guest.save
      flash[:notice] = 'You information has been updated! Thank you.'
      redirect_to guest_path
    else
      render :edit
    end
  end

end