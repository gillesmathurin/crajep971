class LiensController < ApplicationController
  def index
    @liens = Lien.all
  end

  def show
    @lien = Lien.find(params[:id])
  end

  def new
    @lien = Lien.new
  end

  def edit
    @lien = Lien.find(params[:id])
  end
  
  def create
    @lien = Lien.new(params[:lien])
    
    respond_to do |format|
      if @lien.save
        flash[:notice] = "Lien enregistré"
        format.html { redirect_to liens_url }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @lien = Lien.find(params[:id])
    
    respond_to do |format|
      if @lien.update_attributes(params[:lien])
        flash[:notice] = "Modifications enregistrées."
        format.html { redirect_to liens_url }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @lien = Lien.find(params[:id])
    @lien.destroy
    
    respond_to do |format|
      format.html { redirect_to liens_url }
    end
  end
end
