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
    
    respond_to do |format|
      if @abonne && @abonne.destroy
        format.html { render :partial => "success" }
      else
        format.html { render :partial => "failure" }
      end
    end
  end
end
