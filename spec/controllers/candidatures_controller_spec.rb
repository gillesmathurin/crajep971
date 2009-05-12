require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CandidaturesController do

  def mock_candidature(stubs={})
    @mock_candidature ||= mock_model(Candidature, stubs)
  end
  
  describe "GET index" do
    it "assigns all candidatures as @candidatures" do
      Candidature.stub!(:find).with(:all).and_return([mock_candidature])
      get :index
      assigns[:candidatures].should == [mock_candidature]
    end
  end

  describe "GET show" do
    it "assigns the requested candidature as @candidature" do
      Candidature.stub!(:find).with("37").and_return(mock_candidature)
      get :show, :id => "37"
      assigns[:candidature].should equal(mock_candidature)
    end
  end

  describe "GET new" do
    it "assigns a new candidature as @candidature" do
      Candidature.stub!(:new).and_return(mock_candidature)
      get :new
      assigns[:candidature].should equal(mock_candidature)
    end
  end

  describe "GET edit" do
    it "assigns the requested candidature as @candidature" do
      Candidature.stub!(:find).with("37").and_return(mock_candidature)
      get :edit, :id => "37"
      assigns[:candidature].should equal(mock_candidature)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created candidature as @candidature" do
        Candidature.stub!(:new).with({'these' => 'params'}).and_return(mock_candidature(:save => true))
        post :create, :candidature => {:these => 'params'}
        assigns[:candidature].should equal(mock_candidature)
      end

      it "redirects to the created candidature" do
        Candidature.stub!(:new).and_return(mock_candidature(:save => true))
        post :create, :candidature => {}
        response.should redirect_to(candidature_url(mock_candidature))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved candidature as @candidature" do
        Candidature.stub!(:new).with({'these' => 'params'}).and_return(mock_candidature(:save => false))
        post :create, :candidature => {:these => 'params'}
        assigns[:candidature].should equal(mock_candidature)
      end

      it "re-renders the 'new' template" do
        Candidature.stub!(:new).and_return(mock_candidature(:save => false))
        post :create, :candidature => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested candidature" do
        Candidature.should_receive(:find).with("37").and_return(mock_candidature)
        mock_candidature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :candidature => {:these => 'params'}
      end

      it "assigns the requested candidature as @candidature" do
        Candidature.stub!(:find).and_return(mock_candidature(:update_attributes => true))
        put :update, :id => "1"
        assigns[:candidature].should equal(mock_candidature)
      end

      it "redirects to the candidature" do
        Candidature.stub!(:find).and_return(mock_candidature(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(candidature_url(mock_candidature))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested candidature" do
        Candidature.should_receive(:find).with("37").and_return(mock_candidature)
        mock_candidature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :candidature => {:these => 'params'}
      end

      it "assigns the candidature as @candidature" do
        Candidature.stub!(:find).and_return(mock_candidature(:update_attributes => false))
        put :update, :id => "1"
        assigns[:candidature].should equal(mock_candidature)
      end

      it "re-renders the 'edit' template" do
        Candidature.stub!(:find).and_return(mock_candidature(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested candidature" do
      Candidature.should_receive(:find).with("37").and_return(mock_candidature)
      mock_candidature.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the candidatures list" do
      Candidature.stub!(:find).and_return(mock_candidature(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(candidatures_url)
    end
  end

end
