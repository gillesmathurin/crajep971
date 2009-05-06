class ActionsController < ApplicationController
  before_filter :find_categorie_actions
  before_filter :admin_login_required, :only => [:new, :edit, :destroy]
  
  # GET /actions
  # GET /actions.xml
  def index
    if @categorie_action
      @actions = @categorie_action.actions
    else
      @actions = Action.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @actions}
    end
  end
  
  def show
    @action = Action.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @action }
    end
  end
  
  def new
    @action = Action.new
    @categories = CategorieAction.all
  end
  
  def edit
    @action = Action.find(params[:id])
    @categories = CategorieAction.all
  end
  
  def create
    @action = Action.new(params[:uneaction])
    
    respond_to do |format|
      if @action.save
        flash[:notice] = "Action correctement enregistrée."
        format.html { redirect_to categorie_action_actions_url(@action.categorie_action_id) }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update
    @action = Action.find(params[:id])
    
    respond_to do |format|
      if @action.update_attributes(params[:uneaction])
        flash[:notice] = "Mise à jour réussie"
        format.html { redirect_to categorie_action_action_url(@action.categorie_action_id, @action) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @action = Action.find(params[:id])
    @action.destroy
    
    respond_to do |format|
      format.html { redirect_to actions_url }
    end
  end
  
  protected
  
  def find_categorie_actions
    @categorie_action = CategorieAction.find(params[:categorie_action_id]) if params[:categorie_action_id]
  end
end
