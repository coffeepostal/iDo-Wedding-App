# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :first_name, :last_name, :name, :email, :pin, :line_1, :line_2, :city, :state, :zip
  
  helper_method :session_guest, :admin_user
  
  before_filter :session_guest, :admin_user
  
  # find our current guest and set our @session_guest instance variable
  def session_guest
    @session_guest ||= Guest.find(session[:guest_id], :include => [:address, {:gift => :thank_you}, :rsvp]) rescue nil
  end
  
  # redirect if no guest is logged in
  def require_session_guest
    redirect_to login_path unless session_guest
  end
  
  # redirect if a guest is logged in
  def require_no_session_guest
    redirect_to guest_path if session_guest
  end
  
  # is our current @session_guest also an admin user?
  def admin_user
    @admin_user ||= session_guest if session_guest && session_guest.admin?
  end
  
  # require an admin user
  def require_admin_user
    redirect_to guest_path unless admin_user
  end
  
  # load an @guest instance variable from params[:guest_id]
  def load_guest
    @guest = Guest.find(params[:guest_id])
  end
end
