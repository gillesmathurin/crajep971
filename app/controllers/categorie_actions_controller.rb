class CategorieActionsController < ApplicationController
  uses_tiny_mce :options => { :theme => 'simple'}
  before_filter :admin_login_required, :only => [:new, :edit, :destroy]
  
  def index
    @categories = CategorieAction.all
    
    respond_to do |format|
      format.html {  }
      format.xml { render :xml => @categories }
    end
  end

  def show
    @categorie = CategorieAction.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @categorie}
    end
  end

  def new
    @categorie = CategorieAction.new
  end

  def edit
    @categorie = CategorieAction.find(params[:id])
  end
  
  def create
    @categorie = CategorieAction.new(params[:categorie_action])
    
    respond_to do |format|
      if @categorie.save
        flash[:notice] = "Categorie créee avec succès."
        format.html { redirect_to categorie_actions_url() }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update
    @categorie = CategorieAction.find(params[:id])
    
    respond_to do |format|
      if @categorie.update_attributes(params[:categorie_action])
        flash[:notice] = "Modifications enregistrées"
        format.html { redirect_to categorie_action_url(@categorie) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end
  
  def destroy
    @categorie = CategorieAction.find(params[:id])
    @categorie.destroy
    
    respond_to do |format|
      format.html { redirect_to categorie_actions_url }
    end
  end
end
