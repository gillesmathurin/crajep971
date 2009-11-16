class BoardmembersController < ApplicationController
  before_filter :admin_login_required, :only => [:new, :edit, :destroy]
  # GET /boardmembers
  # GET /boardmembers.xml
  def index
    @boardmembers = Boardmember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boardmembers }
    end
  end

  # GET /boardmembers/1
  # GET /boardmembers/1.xml
  def show
    @boardmember = Boardmember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boardmember }
    end
  end

  # GET /boardmembers/new
  # GET /boardmembers/new.xml
  def new
    @boardmember = Boardmember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boardmember }
    end
  end

  # GET /boardmembers/1/edit
  def edit
    @boardmember = Boardmember.find(params[:id])
  end

  # POST /boardmembers
  # POST /boardmembers.xml
  def create
    @boardmember = Boardmember.new(params[:boardmember])

    respond_to do |format|
      if @boardmember.save
        flash[:notice] = 'Boardmember was successfully created.'
        format.html { redirect_to(@boardmember) }
        format.xml  { render :xml => @boardmember, :status => :created, :location => @boardmember }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @boardmember.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boardmembers/1
  # PUT /boardmembers/1.xml
  def update
    @boardmember = Boardmember.find(params[:id])

    respond_to do |format|
      if @boardmember.update_attributes(params[:boardmember])
        flash[:notice] = 'Boardmember was successfully updated.'
        format.html { redirect_to(@boardmember) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @boardmember.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boardmembers/1
  # DELETE /boardmembers/1.xml
  def destroy
    @boardmember = Boardmember.find(params[:id])
    @boardmember.destroy

    respond_to do |format|
      format.html { redirect_to(boardmembers_url) }
      format.xml  { head :ok }
    end
  end
end
