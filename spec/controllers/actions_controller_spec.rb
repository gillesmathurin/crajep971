require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActionsController do
  include AuthenticatedTestHelper
  fixtures :users
  
  def mock_action(stubs={})
    @mock_action ||= mock_model(Action, stubs)
  end

  #Delete this example and add some real ones
  it "should use ActionsController" do
    controller.should be_an_instance_of(ActionsController)
  end
  
  it "should have a before_filter which find the CategorieAction" do
    controller.class.before_filters.should include(:find_categorie_actions)
  end
  
  describe "GET 'index'" do
    
    describe "with a given categorie_action instance" do
      before(:each) do
        @mock_category = mock_model(CategorieAction)
        CategorieAction.should_receive(:find).with("1").and_return(@mock_category)
      end

      it "should exposes all the actions for a given categorie" do
        @mock_category.should_receive(:actions).and_return([mock_action])
        get :index, :categorie_action_id => "1"
        assigns[:actions].should == [mock_action]
      end
    end
    
    describe "without a given categorie_action instance" do
      
      it "should expose all the actions" do
        Action.should_receive(:all).and_return([mock_action])
        get :index
        assigns[:actions].should == [mock_action]
      end
    end
  end
  
  describe "GET 'show'" do
    
    it "should expose the requested action as @action" do
      Action.should_receive(:find).with("1").and_return(mock_action)
      get :show, :id => "1"
      assigns[:action].should == mock_action
      response.should render_template('show')
    end    
    
  end
  
  describe "GET 'new'" do
    
    before(:each) do
      login_as('aaron')
      @categorie = mock_model(CategorieAction)
      # authorize_as('aaron')
    end
    
    it "should expose a new action as @action and the categorie_action as @categories" do
      Action.should_receive(:new).and_return(mock_action)
      CategorieAction.should_receive(:all).and_return([@categorie])
      get :new
      assigns(:action).should == mock_action
      assigns(:categories).should == [@categorie]
      response.should render_template('new')
    end
    
  end
  
  describe "GET 'edit'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose an existing action as @action and all the categorie_action as @categories" do
      Action.should_receive(:find).with("1").and_return(mock_action)
      CategorieAction.should_receive(:all)
      get :edit, :id => "1"
      assigns[:action].should == mock_action
      response.should render_template('edit')
    end
  end
  
  describe "POST 'create'" do
    
    describe "with a successful save" do
      before(:each) do
        @mock_categorie = mock_model(CategorieAction)
      end
      
      it "should expose a newly created action as @action" do
        Action.should_receive(:new).with({'these' => 'params'}).and_return(mock_action(:save => true))
        mock_action.should_receive(:categorie)
        post 'create', :uneaction => {:these => 'params'}
        assigns(:action).should == mock_action
      end
      
      it "redirects to the actions index page for this categorie of action" do
        Action.should_receive(:new).with({'these' => 'params'}).and_return(mock_action(:save => true))
        mock_action.should_receive(:categorie).and_return(@mock_categorie)
        post 'create', :uneaction => {:these => 'params'}
        assigns(:action).should == mock_action
        response.should redirect_to(categorie_action_actions_url(@mock_categorie))
      end
    end
    
    describe "with a failed save" do
      it "should re-render the new template" do
        Action.should_receive(:new).with({'these' => 'params'}).and_return(mock_action(:save => false))
        post 'create', :uneaction => {:these => 'params'}
        assigns(:action).should == mock_action
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT 'update'" do
    
    describe "with a valid params" do
      
      it "should update the requested action" do
        Action.should_receive(:find).with("37").and_return(mock_action)
        mock_action.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :uneaction => {:these => 'params'}
      end
      
      it "should expose the requested action as @action" do
        Action.should_receive(:find).and_return(mock_action(:update_attributes => true))
        put :update, :id => "1"
      end
      
      it "should redirect to the action" do
        Action.should_receive(:find).and_return(mock_action(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(action_url(mock_action))
      end
    end
    
    describe "with invalid params" do
      it "should re-render the edit template" do
        Action.should_receive(:find).and_return(mock_action(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE 'destroy'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should find the requested action" do
      Action.should_receive(:find).with("1").and_return(mock_action)
      mock_action.should_receive(:destroy)
      delete :destroy, :id => "1"
      response.should redirect_to(actions_url)
    end
  end
end
