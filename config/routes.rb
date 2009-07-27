ActionController::Routing::Routes.draw do |map|
  map.resources :guests, :has_one => :address
  map.resources :guests, :has_one => :gift
  map.resources :guests, :has_one => :rsvps
end
