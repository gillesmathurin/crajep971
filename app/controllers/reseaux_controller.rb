class ReseauxController < ApplicationController
  
  def index
    begin
      @associations = Association.find_the_crajep_ones
    rescue ActiveResource::ResourceNotFound, ActiveResource::ServerError,
       ActiveResource::ConnectionError, SocketError
      redirect_to :action => 'not_found'
    end
    @membres = Membre.all
    
    respond_to do |format|
      format.html {  }
      format.xml { render :xml => { @associations.to_xml, @membres.to_xml } }
    end
  end
  
  def not_found
    @membres = Membre.all
  end

  def show
  end

  def new
  end

  def edit
  end

end
