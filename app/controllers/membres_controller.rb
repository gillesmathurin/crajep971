class MembresController < ApplicationController
  uses_tiny_mce
  def index
  end

  def show
  end

  def new
    @membre = Membre.new
  end

  def edit
    @membre = Membre.find(params[:id])
  end
  
  def create
    @membre = Membre.new(params[:membre])
    
    respond_to do |format|
      if @membre.save
        flash[:notice] = "Nouveau membre enregistré"
        format.html { redirect_to reseaux_index_url() }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update
    @membre = Membre.find(params[:id])
    
    respond_to do |format|
      if @membre.update_attributes(params[:membre])
        flash[:notice] = "Membre modifié avec succès."
        format.html { redirect_to membre_url(@membre) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @membre = Membre.find(params[:id])
    @membre.destroy
    
    respond_to do |format|
      format.html { redirect_to reseaux_index_url() }
    end
  end
end
