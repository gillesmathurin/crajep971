require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do

  #Delete these examples and add some real ones
  it "should use ArticlesController" do
    controller.should be_an_instance_of(ArticlesController)
  end
  
  def mock_article(stubs = {})
    @mock_article ||= mock_model(Article, stubs)
  end

  describe "GET 'index'" do    
    it "should expose all the evenements as @actualites" do
      Article.should_receive(:of_the_month).and_return([mock_article])
      get 'index'
      assigns(:actualites).should == [mock_article]
      response.should render_template('index')
    end    
  end

  describe "GET 'show'" do    
    it "should expose the requested article as @article" do
      Article.should_receive(:find).with("1").and_return(mock_article)
      get 'show', :id => "1"
      assigns(:article).should == mock_article
      response.should render_template('show')
    end
  end

  describe "GET 'new'" do
    it "should expose a newly but unsaved article as @article" do
      Article.should_receive(:new).and_return(mock_article)
      get 'new'
      response.should render_template('new')
    end
  end

  describe "GET 'edit'" do
    it "should expose the requested articlie as @article" do
      Article.should_receive(:find).with("37").and_return(mock_article)
      get 'edit', :id => "37"
      response.should render_template('edit')
    end
  end
  
  describe "POST 'create'" do
    
    describe "with a successful save" do
      it "should expose a newly created article as @article and redirect to the index page" do
        Article.should_receive(:new).with({'these' => 'params'}).and_return(mock_article(:save => true))
        post 'create', :article => {:these => 'params'}
        response.should redirect_to(articles_path)
      end
    end
    
    describe "with a failed save" do
      it "should re-render the new template" do
        Article.should_receive(:new).with({'these' => 'params'}).and_return(mock_article(:save => false))
        post 'create', :article => {:these => 'params'}
        response.should render_template('new')
      end
    end
    
  end
  
  describe "PUT 'update'" do
    
    describe "with valid params" do
      it "should find and update the requested article as @article" do
        Article.should_receive(:find).with("37").and_return(mock_article)
        mock_article.should_receive(:update_attributes).with({'these' => 'params'})
        put 'update', :id => "37", :article => {:these => 'params'} 
      end
      
      it "should redirect to the show template" do
        Article.should_receive(:find).with("37").and_return(mock_article(:update_attributes => true))
        put 'update', :id => "37" 
        response.should redirect_to(article_url(mock_article))
      end
    end
    
    describe "with invalid params" do
      it "should re-render the edit template" do
        Article.should_receive(:find).with("37").and_return(mock_article(:update_attributes => false))
        put 'update', :id => "37", :article => {:these => 'params'}
        response.should render_template('edit')
      end
    end
    
  end
  
  describe "DELETE 'destroy'" do
    it "should find the requested article as @article and destroy it" do
      Article.should_receive(:find).with("37").and_return(mock_article)
      mock_article.should_receive(:destroy)
      delete 'destroy', :id => "37"
      response.should redirect_to(articles_url)
    end
  end
end
