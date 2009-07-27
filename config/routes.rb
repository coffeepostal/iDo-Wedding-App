ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => :sessions do |session|
    session.login   'login',  :action => :new,    :conditions => {:method => :get}
    session.login   'login',  :action => :create, :conditions => {:method => :post} 
    session.logout  'logout', :action => :destroy
    
    # make logging in our default route
    session.root    :action => :new
  end
  
  map.resource :guest, :as => 'me', :only => [:show, :edit, :update]
  
  map.resources :admin_guests, :as => 'admin/guests' do |admin_guest|
    admin_guest.resource :address, :rsvp
    admin_guest.resource :gift, :has_one => :thank_you
  end
end
