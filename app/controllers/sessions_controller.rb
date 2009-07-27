class SessionsController < ApplicationController
  before_filter :require_no_guest,  :except => :destroy
  before_filter :require_guest,     :only => :destroy
  
  def new
    @guest = Guest.new
  end

  def create
    if @guest = Guest.find_by_last_name_and_pin(params[:guest][:last_name], params[:guest][:pin])
      flash[:notice] = "Hey there #{@guest.first_name}! Please check your address and RSVP!"
      session[:guest_id] = @guest.id
      redirect_to guest_path
    else
      flash.now[:error] = 'Sorry! The last name and PIN you entered did not match.'
      @guest = Guest.new(:last_name => params[:guest][:last_name])
      render :new
    end
  end

  def destroy
    session[:guest_id] = nil
    redirect_to login_path
  end
end
