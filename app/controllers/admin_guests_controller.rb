class AdminGuestsController < ApplicationController
  include CsvImport
  
  before_filter :require_admin_user
  
  class << self
    # use our app/views/guests/ views rather than app/views/admin_guests/
    def controller_path
      @controller_path ||= 'guests'
    end
  end
  
  def index
    # grab all non-admin guests
    @guests = params[:admin] ? Guest.all : Guest.non_admin
    @guests -= [@admin_user] unless params[:me]
  end
  
  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      flash[:notive] = 'Guest was successfully created.'
      redirect_to admin_guest_path(@guest)
    else
      render :new
    end
  end
  
  def edit
    @guest = Guest.find(params[:id])
  end
  
  def update
    have_admin_guest = @admin_user && params.key?(:id)
    @guest = Guest.find(params[:id]) if have_admin_guest
    
    if @guest.update_attributes(params[:guest])
      flash[:notice] = 'Guest was successfully updated.'
      redirect_to have_admin_guest ? admin_guest_path(@guest) : guest_path
    else
      render :edit
    end
  end
  
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to admin_guests_path
  end
  
  def import
    # only do the actual import if this is a POST request
    if request.post?      
      Guest.non_admin.all.each(&:destroy) if params[:destroy_all_non_admin_first]
      # Guest.destroy_all if params[:destroy_all_first]
      
      each_csv_row do |row_hash|        
        # Guest info
        guest_attributes = row_hash.select do |k,v|
          [:salutation, :first_name, :last_name, :name, :suffix, :email].include?(k.to_sym)
        end.inject({}) do |memo, pair|
          memo[pair.first.to_sym] = pair.last
          memo
        end
        
        first_name, last_name = (guest_attributes.keys.include?(:name) ?
          guest_attributes[:name].split(' ', 2) :
          [guest_attributes[:first_name], guest_attributes[:last_name]])
        
        guest = Guest.find_or_create_by_first_name_and_last_name(
          :first_name => first_name,
          :last_name => last_name
        )
        guest.attributes = guest_attributes
      
        # Address info
        address_attributes = row_hash.select do |k,v|
          [:line_1, :line_2, :city, :state, :zip, :country, :province, :additional_names].include?(k.to_sym)
        end.inject({}) do |memo, pair|
          memo[pair.first.to_sym] = pair.last
          memo
        end
        
        address = guest.address || guest.build_address
        address.attributes = address_attributes
      
        # RSVP info
        rsvp_attributes = row_hash.select do |k,v|
          [:attending, :number_attending].include?(k.to_sym)
        end.inject({}) do |memo, pair|
          memo[pair.first.to_sym] = pair.last
          memo
        end
        
        rsvp = guest.rsvp || guest.build_rsvp
        rsvp.attributes = rsvp_attributes.update(
          :admin_rsvp => [1,0,'1','0','t','f','true','false',true,false].include?(rsvp_attributes[:attending])
        )
      
        # save it all!
        guest.save
      end
    end
  end
  
end
