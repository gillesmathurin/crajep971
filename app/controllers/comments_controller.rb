class CommentsController < ApplicationController
  before_filter :find_article
  
  def index
    @comments = @article.comments
  end

  def show
    @comment = @article.comments.find(params[:id])
  end

  def new
    @comment = @article.comments.build
  end

  def edit
    @comment = @article.comments.find(params[:id])
  end
  
  def create
    @comment = @article.comments.build(params[:comment])
    @comment.author = current_user
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = "Commentaire enregistré"
        format.html { redirect_to article_path(@article) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @comment = @article.comments.find(params[:id])
    @comment.author = current_user
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = "Modifications enregistrées"
        format.html { redirect_to article_path(@article) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      if @article
        format.html { redirect_to article_path(@artile) }
      else
        format.html { redirect_to comments_path() }
      end
    end
  end
  
  private
  
  def find_article
    @article = Article.find(params[:article_id]) if params[:article_id]
  end
end
