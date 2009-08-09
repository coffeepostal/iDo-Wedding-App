class ThankYousController < ApplicationController
  before_filter :require_admin_user
  before_filter :load_guest, :except => :index
  before_filter :load_guest_gift, :except => :index
  before_filter :require_guest_gift, :except => :index
  before_filter :load_guest_gift_thank_you, :except => [:index, :new, :create]
  
  def index
    @gifts = Gift.all(:include => [:thank_you, :guest])
  end
  
  def show
    # @guest
    # @gift
    # @thank_you
  end
  
  def new
    # @guest
    # @gift
    @thank_you = @gift.build_thank_you
  end
  
  def create
    # @guest
    # @gift
    @thank_you = @gift.create_thank_you(params[:thank_you])
    if @thank_you.valid?
      flash[:notice] = 'Thank You has been successfully saved!'
      redirect_to admin_guest_gift_path(@guest, @gift)
    else
      render :new
    end
  end
  
  def edit
    # @guest
    # @gift
    # @thank_you
  end
  
  def update
    # @guest
    # @gift
    # @thank_you
    if @thank_you.update_attributes(params[:thank_you])
      flash[:notice] = 'Thank You has been successfully updated.'
      redirect_to admin_guest_gift_path(@guest, @gift)
    else
      render :edit
    end
  end
  
  def destroy
    # @guest
    # @gift
    # @thank_you
    @thank_you.destroy
    redirect_to admin_guest_gift_path(@guest, @gift)
  end
  
  private
  
  def load_guest_gift
    # @guest
    @gift = @guest.gift
  end
  
  def require_guest_gift
    # @guest
    # @gift
    redirect_to thank_yous_path unless @gift
  end
  
  def load_guest_gift_thank_you
    # @guest
    # @gift
    @thank_you = @gift.thank_you
  end
end
