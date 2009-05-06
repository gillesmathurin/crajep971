class ActionsController < ApplicationController
  before_filter :find_categorie_actions
  
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
  
  protected
  
  def find_categorie_actions
    @categorie_action = CategorieAction.find(params[:categorie_action_id]) if params[:categorie_action_id]
  end
end
