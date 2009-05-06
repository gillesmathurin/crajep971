require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CategorieActionsController do
  include AuthenticatedTestHelper
  fixtures :users

  #Delete these examples and add some real ones
  it "should use CategorieActionsController" do
    controller.should be_an_instance_of(CategorieActionsController)
  end

  def mock_categorie(stubs={})
    @mock_categorie ||= mock_model(CategorieAction, stubs)
  end
  
  it "should have the admin_login_required before_filter" do
    controller.class.before_filters.should include(:admin_login_required)
  end

  describe "GET 'index'" do
    
    it "should expose all the categorie_actions as @categories" do
     CategorieAction.should_receive(:all).and_return([mock_categorie])
     get 'index'
     assigns(:categories).should == [mock_categorie]
    end
    
    it "should render the index template" do
      CategorieAction.should_receive(:all).and_return([mock_categorie])
       get 'index'
       assigns(:categories).should == [mock_categorie]
       response.should render_template('index')
    end
  end

  describe "GET 'show'" do
    
    it "should expose the requested categorie_action as @categorie" do
      CategorieAction.should_receive(:find).with("1").and_return(mock_categorie)
      get 'show', :id => "1"
      assigns(:categorie).should == mock_categorie
      response.should be_success
    end
    
    it "should render the show template" do
      CategorieAction.should_receive(:find).with("1").and_return(mock_categorie)
      get 'show', :id => "1"
      assigns(:categorie).should == mock_categorie
      response.should be_success
      response.should render_template('show')
    end
  end

  describe "GET 'new'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose a newly but unsaved categorie as @categorie" do
      CategorieAction.should_receive(:new).and_return(mock_categorie)
      get 'new'
      assigns(:categorie).should == mock_categorie
      response.should render_template('new')
    end
    
  end

  describe "GET 'edit'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose the requested categorie as @categorie" do
      CategorieAction.should_receive(:find).with("1").and_return(mock_categorie)
      get 'edit', :id => "1"
      assigns(:categorie).should == mock_categorie
      response.should render_template('edit')
    end
  end
  
  describe "POST 'create'" do
    
    describe "with a succesful save" do
      
      it "should expose a newly created categorie_action as @categorie" do
        CategorieAction.should_receive(:new).with({'these' => 'params'}).
        and_return(mock_categorie(:save => true))
        post 'create', :categorie_action => {:these => 'params'}
        assigns(:categorie).should == mock_categorie
      end
      
      it "should redirect_to the categorie_actions index page" do
        CategorieAction.should_receive(:new).and_return(mock_categorie(:save => true))
        post 'create', :categorie_action => {:these => 'params'}
        assigns(:categorie).should == mock_categorie
        response.should redirect_to(categorie_actions_url)
      end
    end
    
    describe "with a failed save" do
      it "should re-render the new template" do
        CategorieAction.should_receive(:new).and_return(mock_categorie(:save => false))
        post 'create', :categorie_action => {:these => 'params'}
        response.should render_template(:new)        
      end
    end
  end
  
  describe "PUT 'update" do
    
    describe "with valid params" do
      
      it "should update and expose the requested categorie " do
        CategorieAction.should_receive(:find).with("1").and_return(mock_categorie(:update_attributes => true))
        put 'update', :id => "1", :categorie_action => {:these => 'params'}
        response.should redirect_to(categorie_action_url(mock_categorie))
      end
      
    end
    
    describe "with invalid params" do
      it "should found the requested categorie_action and re-render the edit template" do
        CategorieAction.should_receive(:find).with("1").and_return(mock_categorie(:update_attributes => false))
        put 'update', :id => "1", :categorie_action => {:these => 'params'}
        response.should render_template('edit')
      end
    end

  end
  
  describe "DELETE 'destroy'" do
    
    it "should find the requested categorie_action as @categorie, destroy it and redirect_to the index page" do
      CategorieAction.should_receive(:find).with("1").and_return(mock_categorie)
      mock_categorie.should_receive(:destroy)
      delete 'destroy', :id => "1"
      response.should redirect_to(categorie_actions_url)      
    end
  end
end
