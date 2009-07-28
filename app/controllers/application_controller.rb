# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :first_name, :last_name, :name, :email, :pin, :line_1, :line_2, :city, :state, :zip
  
  before_filter :current_guest, :current_admin
  
  helper_method :current_guest, :current_admin
  
  # find our current guest and set our @guest instance variable
  def current_guest
    @guest ||= Guest.find(session[:guest_id]) rescue nil
  end
  
  # redirect if no guest is logged in
  def require_guest
    redirect_to login_path unless current_guest
  end
  
  # redirect if a guest is logged in
  def require_no_guest
    redirect_to guest_path if current_guest
  end
  
  # find our current admin user and set the @admin instance variable
  def current_admin
    @admin ||= current_guest if current_guest && current_guest.admin?
  end
  
  # require an admin user
  def require_admin
    redirect_to guest_path unless current_admin
  end
end
