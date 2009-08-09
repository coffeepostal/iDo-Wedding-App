ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => :sessions do |session|
    session.login   'login',  :action => :new,    :conditions => {:method => :get}
    session.login   'login',  :action => :create, :conditions => {:method => :post} 
    session.logout  'logout', :action => :destroy
    
    # make logging in our default route
    session.root :action => :new
  end
  
  map.resource :guest, :as => 'me', :only => [:show, :edit, :update]
  
  map.resources :guests, :controller => 'admin_guests', :name_prefix => 'admin_', :collection => {:import => [:get, :post]} do |guests|
    guests.resource :address, :rsvp
    guests.resources :gifts, :has_one => :thank_you
  end
  
  map.resources :addresses, :gifts, :rsvps, :thank_yous, :only => :index
end
