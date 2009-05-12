class CandidaturesController < ApplicationController
  # GET /candidatures
  # GET /candidatures.xml
  def index
    @candidatures = Candidature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @candidatures }
    end
  end

  # GET /candidatures/1
  # GET /candidatures/1.xml
  def show
    @candidature = Candidature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @candidature }
    end
  end

  # GET /candidatures/new
  # GET /candidatures/new.xml
  def new
    @candidature = Candidature.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidature }
    end
  end

  # GET /candidatures/1/edit
  def edit
    @candidature = Candidature.find(params[:id])
  end

  # POST /candidatures
  # POST /candidatures.xml
  def create
    @candidature = Candidature.new(params[:candidature])

    respond_to do |format|
      if @candidature.save
        Mailer.deliver_candidature(@candidature)
        flash[:notice] = 'Votre demande a bien été prise en compte.'
        format.html { redirect_to(@candidature) }
        format.xml  { render :xml => @candidature, :status => :created, :location => @candidature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /candidatures/1
  # PUT /candidatures/1.xml
  def update
    @candidature = Candidature.find(params[:id])

    respond_to do |format|
      if @candidature.update_attributes(params[:candidature])
        flash[:notice] = 'Candidature modifiée correctement.'
        format.html { redirect_to(@candidature) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatures/1
  # DELETE /candidatures/1.xml
  def destroy
    @candidature = Candidature.find(params[:id])
    @candidature.destroy

    respond_to do |format|
      format.html { redirect_to(candidatures_url) }
      format.xml  { head :ok }
    end
  end
end
