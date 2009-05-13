class AbonnesController < ApplicationController
  
  def index
    @abonnes = Abonne.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @abonnes.to_xml }
    end
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
    @abonne = Abonne.new(params[:abonne])
    
    respond_to do |format|
      if @abonne.save && request.xhr?
        format.html { render :nothing => true }
      elsif request.xhr?
        format.html { render :nothing => true }
      end
    end
  end
  
  def destroy
    @abonne = Abonne.find_by_email(params[:email])
    @abonne.destroy
    
    respond_to do |format|
      if request.xhr?
        format.html { render :nothing => true }
      end
    end
  end
end
