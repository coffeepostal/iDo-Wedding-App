class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find params[:id]
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new params[:guest]
    if @guest.save
      redirect_to @guest
    else
      render :new
    end
  end

  def edit
    @guest = Guest.find params[:id]
  end

  def update
    @guest = Guest.find params[:id]
    if @guest.update_attributes params[:guest]
      redirect_to @guest
    else
      render :edit
    end
  end

  def destroy
    Guest.find(params[:id]).destroy
    redirect_to :guests
  end
end
