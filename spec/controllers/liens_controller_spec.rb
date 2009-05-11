require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LiensController do
  include AuthenticatedTestHelper
  fixtures :users
  
  def mock_lien(stubs={})
    @mock_lien ||= mock_model(Lien, stubs)    
  end

  #Delete these examples and add some real ones
  it "should use LiensController" do
    controller.should be_an_instance_of(LiensController)
  end

  describe "GET 'index'" do
    it "should expose all the liens as @liens" do
      Lien.should_receive(:all).and_return([mock_lien])
      get 'index'
      assigns(:liens).should == [mock_lien]
      response.should render_template('index')
    end
  end

  describe "GET 'show'" do
    it "should expose the requested lien as @lien" do
      Lien.should_receive(:find).with("1").and_return(mock_lien)
      get 'show', :id => "1"
      assigns(:lien).should == mock_lien
      response.should render_template('show')
    end
  end

  describe "GET 'new'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose a new but unsaved lien as @lien" do
      Lien.should_receive(:new).and_return(mock_lien)     
      get 'new'
      assigns(:lien).should == mock_lien
      response.should render_template('new')
    end
  end

  describe "GET 'edit'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose the requested lien as @lien" do
      Lien.should_receive(:find).with("1").and_return(mock_lien)
      get 'edit', :id => "1"
      assigns(:lien).should == mock_lien
      response.should render_template('edit')
    end
  end
  
  describe "POST, 'create'" do
    
    describe "with a successful lien" do
      it "should expose a newly created lien as @lien" do
        Lien.should_receive(:new).with({}).and_return(mock_lien(:save => true))
        post :create, :lien => {}
        assigns(:lien).should == mock_lien
      end
      
      it "should redirect_to the index page" do
        Lien.should_receive(:new).with({}).and_return(mock_lien(:save => true))
        post :create, :lien => {}
        assigns(:lien).should == mock_lien
        response.should redirect_to(liens_url)
      end
    end
    
    describe "with a failed save" do
      it "should re-render the new template" do
        Lien.should_receive(:new).with({}).and_return(mock_lien(:save => false))
        post :create, :lien => {}
        response.should render_template('new')
      end
    end
  end
  
  describe "PUT, 'update'" do
    
    describe "with valid params" do
      it "should find the requested lien for update" do
        Lien.should_receive(:find).with("1").and_return(mock_lien(:update_attributes => true))
        put :update, :id => "1"
        assigns(:lien).should == mock_lien
      end
      
      it "should redirect_to the index template" do
        Lien.should_receive(:find).with("1").and_return(mock_lien(:update_attributes => true))
        put :update, :id => "1"
        assigns(:lien).should == mock_lien
        response.should redirect_to(liens_url)
      end
    end
  end
  
  describe "DELETE, 'destroy'" do
    
    it "should find the requested lien and destroy it" do
      Lien.should_receive(:find).with("1").and_return(mock_lien)
      mock_lien.should_receive(:destroy)
      delete :destroy, :id => "1"
      response.should redirect_to(liens_url)
    end
  end
end
