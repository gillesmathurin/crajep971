require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EvenementsController do
  include AuthenticatedTestHelper
  fixtures :users
  
  #Delete these examples and add some real ones
  it "should use EvenementsController" do
    controller.should be_an_instance_of(EvenementsController)
  end

  def mock_evenement(stubs ={})
    @mock_evenement ||= mock_model(Evenement, stubs)
  end

  describe "GET 'index'" do
    
    it "should expose the requested evenements as @evenements into the index template" do
      Evenement.should_receive(:of_the_month).and_return([mock_evenement])
      get 'index'
      assigns(:evenements).should == [mock_evenement]
      response.should render_template('index')
    end
    
  end

  describe "GET 'show'" do
    
    it "should expose the requested evenement as @evenement" do
      Evenement.should_receive(:find).with("37").and_return(mock_evenement)
      get :show, :id => "37"
      assigns(:evenement).should == mock_evenement
      response.should render_template('show')
    end
    
  end

  describe "GET 'new'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose a newly created but unsaved evenement as @evenement" do
      Evenement.should_receive(:new).and_return(mock_evenement)
      get 'new'
      assigns(:evenement).should == mock_evenement
      response.should render_template(:new)
    end
  end

  describe "GET 'edit'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should expose the requested evenement as @evenement" do
      Evenement.should_receive(:find).with("37").and_return(mock_evenement)
      get 'edit', :id => "37"
      assigns(:evenement).should == mock_evenement
      response.should render_template(:edit)
    end
  end
  
  describe "POST, 'create'" do
    
    describe "with a successful save" do    
      it "should expose a newly created evenement as @evenement" do
        Evenement.should_receive(:new).with({'these' => 'params'}).and_return(mock_evenement(:save => true))
        post 'create', :evenement => {:these => "params"}
        assigns(:evenement).should == mock_evenement
      end
      
      it "should redirect to the evenements index template" do
        Evenement.should_receive(:new).with({'these' => 'params'}).and_return(mock_evenement(:save => true))
        post 'create', :evenement => {:these => "params"}
        assigns(:evenement).should == mock_evenement
        response.should redirect_to(evenements_path)
      end
    end
    
    describe "with a failed save" do    
      it "should re-render the new action" do
        Evenement.should_receive(:new).with({'these' => 'params'}).and_return(mock_evenement(:save => false))
        post 'create',  :evenement => {:these => "params"}
        response.should render_template('new')
      end
    end
  end
  
  describe "PUT, 'update'" do
    
    describe "with valid params" do     
      it "should update the requested evenement" do
        Evenement.should_receive(:find).with("37").and_return(mock_evenement(:update_attributes => true))
        put :update, :id => "37", :evenement => {:these => "params"}
        response.should redirect_to(evenement_path(mock_evenement))
      end
    end
    
    describe "with invalid params" do
      it "should update the requested evenement" do
        Evenement.should_receive(:find).with("37").and_return(mock_evenement(:update_attributes => false))
        put :update, :id => "37", :evenement => {:these => "params"}
        response.should render_template('edit')
      end
    end
    
  end
  
  describe "DELETE 'destroy'" do
    
    before(:each) do
      login_as('aaron')
    end
    
    it "should find the requested evenement and destroy it and redirect_to the index template" do
      Evenement.should_receive(:find).with("37").and_return(mock_evenement)
      mock_evenement.should_receive(:destroy)
      delete :destroy, :id => "37"
      response.should redirect_to(evenements_path)
    end
  end
end
