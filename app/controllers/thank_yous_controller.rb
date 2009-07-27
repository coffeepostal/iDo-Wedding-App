class ThankYousController < ApplicationController
  # GET /thank_yous
  # GET /thank_yous.xml
  def index
    @thank_yous = ThankYous.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thank_yous }
    end
  end

  # GET /thank_yous/1
  # GET /thank_yous/1.xml
  def show
    @thank_yous = ThankYous.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thank_yous }
    end
  end

  # GET /thank_yous/new
  # GET /thank_yous/new.xml
  def new
    @thank_yous = ThankYous.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thank_yous }
    end
  end

  # GET /thank_yous/1/edit
  def edit
    @thank_yous = ThankYous.find(params[:id])
  end

  # POST /thank_yous
  # POST /thank_yous.xml
  def create
    @thank_yous = ThankYous.new(params[:thank_yous])

    respond_to do |format|
      if @thank_yous.save
        flash[:notice] = 'ThankYous was successfully created.'
        format.html { redirect_to(@thank_yous) }
        format.xml  { render :xml => @thank_yous, :status => :created, :location => @thank_yous }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thank_yous.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thank_yous/1
  # PUT /thank_yous/1.xml
  def update
    @thank_yous = ThankYous.find(params[:id])

    respond_to do |format|
      if @thank_yous.update_attributes(params[:thank_yous])
        flash[:notice] = 'ThankYous was successfully updated.'
        format.html { redirect_to(@thank_yous) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thank_yous.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thank_yous/1
  # DELETE /thank_yous/1.xml
  def destroy
    @thank_yous = ThankYous.find(params[:id])
    @thank_yous.destroy

    respond_to do |format|
      format.html { redirect_to(thank_yous_url) }
      format.xml  { head :ok }
    end
  end
end
