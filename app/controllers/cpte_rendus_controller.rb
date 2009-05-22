class CpteRendusController < ApplicationController
  before_filter :member_login_required
  
  def index
    @cpte_rendus = CpteRendu.all(:order => "published_at desc")
  end

  def show
    @cpte_rendu = CpteRendu.find(params[:id])
  end

  def new
    @cpte_rendu = CpteRendu.new
  end

  def edit
    @cpte_rendu = CpteRendu.find(params[:id])
  end
  
  def create
    @cpte_rendu = CpteRendu.new(params[:cpte_rendu])
    
    respond_to do |format|
      if @cpte_rendu.save
        format.html { redirect_to cpte_rendus_url() }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @cpte_rendu = CpteRendu.find(params[:id])
    
    respond_to do |format|
      if @cpte_rendu.update_attributes(params[:cpte_rendu])
        format.html { redirect_to cpte_rendu_url(@cpte_rendu) }
      else
        format.html { render :action => "edit"}
      end
    end
  end
  
  def destroy
    @cpte_rendu = CpteRendu.find(params[:id])
    @cpte_rendu.destroy
    
    respond_to do |format|
      format.html { redirect_to cpte_rendus_url }
    end
  end
end
