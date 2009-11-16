require 'spec_helper'

describe BoardmembersController do

  def mock_boardmember(stubs={})
    @mock_boardmember ||= mock_model(Boardmember, stubs)
  end

  describe "GET index" do
    it "assigns all boardmembers as @boardmembers" do
      Boardmember.stub!(:find).with(:all).and_return([mock_boardmember])
      get :index
      assigns[:boardmembers].should == [mock_boardmember]
    end
  end

  describe "GET show" do
    it "assigns the requested boardmember as @boardmember" do
      Boardmember.stub!(:find).with("37").and_return(mock_boardmember)
      get :show, :id => "37"
      assigns[:boardmember].should equal(mock_boardmember)
    end
  end

  describe "GET new" do
    it "assigns a new boardmember as @boardmember" do
      Boardmember.stub!(:new).and_return(mock_boardmember)
      get :new
      assigns[:boardmember].should equal(mock_boardmember)
    end
  end

  describe "GET edit" do
    it "assigns the requested boardmember as @boardmember" do
      Boardmember.stub!(:find).with("37").and_return(mock_boardmember)
      get :edit, :id => "37"
      assigns[:boardmember].should equal(mock_boardmember)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created boardmember as @boardmember" do
        Boardmember.stub!(:new).with({'these' => 'params'}).and_return(mock_boardmember(:save => true))
        post :create, :boardmember => {:these => 'params'}
        assigns[:boardmember].should equal(mock_boardmember)
      end

      it "redirects to the created boardmember" do
        Boardmember.stub!(:new).and_return(mock_boardmember(:save => true))
        post :create, :boardmember => {}
        response.should redirect_to(boardmember_url(mock_boardmember))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved boardmember as @boardmember" do
        Boardmember.stub!(:new).with({'these' => 'params'}).and_return(mock_boardmember(:save => false))
        post :create, :boardmember => {:these => 'params'}
        assigns[:boardmember].should equal(mock_boardmember)
      end

      it "re-renders the 'new' template" do
        Boardmember.stub!(:new).and_return(mock_boardmember(:save => false))
        post :create, :boardmember => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested boardmember" do
        Boardmember.should_receive(:find).with("37").and_return(mock_boardmember)
        mock_boardmember.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :boardmember => {:these => 'params'}
      end

      it "assigns the requested boardmember as @boardmember" do
        Boardmember.stub!(:find).and_return(mock_boardmember(:update_attributes => true))
        put :update, :id => "1"
        assigns[:boardmember].should equal(mock_boardmember)
      end

      it "redirects to the boardmember" do
        Boardmember.stub!(:find).and_return(mock_boardmember(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(boardmember_url(mock_boardmember))
      end
    end

    describe "with invalid params" do
      it "updates the requested boardmember" do
        Boardmember.should_receive(:find).with("37").and_return(mock_boardmember)
        mock_boardmember.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :boardmember => {:these => 'params'}
      end

      it "assigns the boardmember as @boardmember" do
        Boardmember.stub!(:find).and_return(mock_boardmember(:update_attributes => false))
        put :update, :id => "1"
        assigns[:boardmember].should equal(mock_boardmember)
      end

      it "re-renders the 'edit' template" do
        Boardmember.stub!(:find).and_return(mock_boardmember(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested boardmember" do
      Boardmember.should_receive(:find).with("37").and_return(mock_boardmember)
      mock_boardmember.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the boardmembers list" do
      Boardmember.stub!(:find).and_return(mock_boardmember(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(boardmembers_url)
    end
  end

end
