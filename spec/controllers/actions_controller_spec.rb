require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActionsController do
  
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
    
    before(:each) do
      @mock_category = mock_model(CategorieAction)
      CategorieAction.should_receive(:find).with("1").and_return(@mock_category)
    end
    
    it "should exposes all the actions for a given categorie" do
      @mock_category.should_receive(:actions).and_return([mock_action])
      get :index
      assigns[:actions].should ==[mock_action]
    end
  end
end
