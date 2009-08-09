class GiftsController < ApplicationController
  before_filter :require_admin_user
  before_filter :load_guest, :except => :index
  before_filter :load_guest_gift, :except => [:index, :new, :create]
  
  def index
    @guests = Guest.all(:include => :gift)
  end
  
  def show
    # @guest
    # @gift
  end
  
  def new
    # @guest
    @gift = @guest.build_gift
  end
  
  def create
    # @guest
    @gift = @guest.create_gift(params[:gift])
    if @gift.valid?
      flash[:notice] = 'Gift was successfully saved!'
      redirect_to admin_guest_path(@guest)
    else
      render :new
    end
  end
  
  def edit
    # @guest
    # @gift
  end
  
  def update
    # @guest
    # @gift
    if @gift.update_attributes(params[:gift])
      flash[:notice] = 'Gift was successfully updated.'
      redirect_to admin_guest_path(@guest)
    else
      render :edit
    end
  end
  
  def destroy
    # @guest
    # @gift
    @gift.destroy
    redirect_to admin_guest_path(@guest)
  end
  
  private
  
  def load_guest_gift
    # @guest
    @gift = @guest.gift
  end
end
