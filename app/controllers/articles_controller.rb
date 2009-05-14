class ArticlesController < ApplicationController
  before_filter :admin_login_required, :only => [:new, :edit, :destroy]
  uses_tiny_mce :options => { :theme => 'simple' }
  
  def index
    @articles = Article.of_the_month(:order => 'created_at desc')
    
    respond_to do |format|
      format.html {  }
    end
  end

  def show
    @article = Article.find(params[:id])
    
    respond_to do |format|
      format.html {  }
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    @article.author = current_user
    
    respond_to do |format|
      if @article.save
        flash[:notice] = "Votre article a bien été enregistré."
        format.html { redirect_to articles_url }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update
    @article = Article.find(params[:id])
    
    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = "Modification de l'article enregistré."
        format.html { redirect_to article_url(@article) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    respond_to do |format|
      format.html { redirect_to articles_url }
    end
  end
end
