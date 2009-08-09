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
    if request.post?
      Guest.non_admin.all.each(&:destroy) if params[:destroy_all_non_admin_first]
      Guest.destroy_all if params[:destroy_all_first]
    
      each_csv_row do |row|
        # Guest info
        salutation, first_name, last_name, suffix, email = row[0..4]
        guest = Guest.find_or_create_by_first_name_and_last_name(:first_name => first_name, :last_name => last_name)
        guest.attributes = {:salutation => salutation, :suffix => suffix, :email => email}
        # guest.admin if [1, '1', 't', 'true', true].include?(admin)
      
        # Address info
        line_1, line_2, city, state, zip, country, province, additional_names = row[5..12]
        address = guest.address || guest.build_address
        address.attributes = {
          :line_1 => line_1,
          :line_2 => line_2,
          :city => city,
          :state => state,
          :zip => zip,
          :country => country,
          :province => province,
          :additional_names => additional_names
        }
      
        # RSVP info
        attending, number_attending = row[13,14]
        rsvp = guest.rsvp || guest.build_rsvp
        rsvp.attributes = {
          :attending => attending,
          :number_attending => number_attending,
          :admin_rsvp => [1,0,'1','0','t','f','true','false',true,false].include?(attending)
        }
      
        # save it all!
        guest.save
      end
      
      flash[:notice] = 'Guests successfully imported.'
      redirect_to admin_guests_path
    end
  end
  
end
