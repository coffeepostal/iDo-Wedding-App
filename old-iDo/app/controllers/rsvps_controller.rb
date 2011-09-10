class RsvpsController < ApplicationController
  before_filter :require_admin_user
  before_filter :load_guest, :except => :index
  before_filter :load_guest_rsvp, :except => [:index, :new, :create]
  
  def index
    @guests = Guest.non_admin(:include => :rsvp)
  end
  
  def show
    # @guest
    # @rsvp
  end
  
  def new
    # @guest
    @rsvp = @guest.build_rsvp
  end
  
  def create
    # @guest
    @rsvp = @guest.create_rsvp(params[:rsvp])
    if @rsvp.valid?
      flash[:notice] = 'RSVP was successfully saved!'
      redirect_to admin_guest_path(@guest)
    else
      render :new
    end
  end
  
  def edit
    # @guest
    # @rsvp
  end
  
  def update
    # @guest
    # @rsvp
    if @rsvp.update_attributes(params[:rsvp])
      flash[:notice] = 'RSVP was successfully updated.'
      redirect_to admin_guest_path(@guest)
    else
      render :edit
    end
  end
  
  def destroy
    # @guest
    # @rsvp
    @rsvp.destroy
    redirect_to admin_guest_path(@guest)
  end
  
  private
  
  def load_guest_rsvp
    # @guest
    @rsvp = @guest.rsvp
  end
end
