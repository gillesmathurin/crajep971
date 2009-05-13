require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NlContentsController do

  def mock_nl_content(stubs={})
    @mock_nl_content ||= mock_model(NlContent, stubs)
  end
  
  describe "GET index" do
    it "assigns all nl_contents as @nl_contents" do
      NlContent.stub!(:find).with(:all).and_return([mock_nl_content])
      get :index
      assigns[:nl_contents].should == [mock_nl_content]
    end
  end

  describe "GET show" do
    it "assigns the requested nl_content as @nl_content" do
      NlContent.stub!(:find).with("37").and_return(mock_nl_content)
      get :show, :id => "37"
      assigns[:nl_content].should equal(mock_nl_content)
    end
  end

  describe "GET new" do
    it "assigns a new nl_content as @nl_content" do
      NlContent.stub!(:new).and_return(mock_nl_content)
      get :new
      assigns[:nl_content].should equal(mock_nl_content)
    end
  end

  describe "GET edit" do
    it "assigns the requested nl_content as @nl_content" do
      NlContent.stub!(:find).with("37").and_return(mock_nl_content)
      get :edit, :id => "37"
      assigns[:nl_content].should equal(mock_nl_content)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created nl_content as @nl_content" do
        NlContent.stub!(:new).with({'these' => 'params'}).and_return(mock_nl_content(:save => true))
        post :create, :nl_content => {:these => 'params'}
        assigns[:nl_content].should equal(mock_nl_content)
      end

      it "redirects to the created nl_content" do
        NlContent.stub!(:new).and_return(mock_nl_content(:save => true))
        post :create, :nl_content => {}
        response.should redirect_to(nl_content_url(mock_nl_content))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved nl_content as @nl_content" do
        NlContent.stub!(:new).with({'these' => 'params'}).and_return(mock_nl_content(:save => false))
        post :create, :nl_content => {:these => 'params'}
        assigns[:nl_content].should equal(mock_nl_content)
      end

      it "re-renders the 'new' template" do
        NlContent.stub!(:new).and_return(mock_nl_content(:save => false))
        post :create, :nl_content => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested nl_content" do
        NlContent.should_receive(:find).with("37").and_return(mock_nl_content)
        mock_nl_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :nl_content => {:these => 'params'}
      end

      it "assigns the requested nl_content as @nl_content" do
        NlContent.stub!(:find).and_return(mock_nl_content(:update_attributes => true))
        put :update, :id => "1"
        assigns[:nl_content].should equal(mock_nl_content)
      end

      it "redirects to the nl_content" do
        NlContent.stub!(:find).and_return(mock_nl_content(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(nl_content_url(mock_nl_content))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested nl_content" do
        NlContent.should_receive(:find).with("37").and_return(mock_nl_content)
        mock_nl_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :nl_content => {:these => 'params'}
      end

      it "assigns the nl_content as @nl_content" do
        NlContent.stub!(:find).and_return(mock_nl_content(:update_attributes => false))
        put :update, :id => "1"
        assigns[:nl_content].should equal(mock_nl_content)
      end

      it "re-renders the 'edit' template" do
        NlContent.stub!(:find).and_return(mock_nl_content(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested nl_content" do
      NlContent.should_receive(:find).with("37").and_return(mock_nl_content)
      mock_nl_content.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the nl_contents list" do
      NlContent.stub!(:find).and_return(mock_nl_content(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(nl_contents_url)
    end
  end

end
