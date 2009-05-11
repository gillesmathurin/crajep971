class EvenementsController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :destroy]
  
  def index
    @evenements = Evenement.of_the_month
    
    respond_to do |format|
      format.html {  }
    end
  end

  def show
    @evenement = Evenement.find(params[:id])
    
    respond_to do |format|
      format.html {  }
    end
  end

  def new
    @evenement = Evenement.new
  end

  def edit
    @evenement = Evenement.find(params[:id])
  end
  
  def create
    @evenement = Evenement.new(params[:evenement])
    
    respond_to do |format|
      if @evenement.save
        flash[:notice] = "Evenement enregistré"
        format.html { redirect_to evenements_url() }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @evenement = Evenement.find(params[:id])
    
    respond_to do |format|
      if @evenement.update_attributes(params[:evenement])
        flash[:notice] = "Modifications enregistrées"
        format.html { redirect_to evenement_url(@evenement) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @evenement = Evenement.find(params[:id])
    @evenement.destroy
    
    respond_to do |format|
      format.html { redirect_to evenements_url() }
    end
  end

end
