require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NlContentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "nl_contents", :action => "index").should == "/nl_contents"
    end
  
    it "maps #new" do
      route_for(:controller => "nl_contents", :action => "new").should == "/nl_contents/new"
    end
  
    it "maps #show" do
      route_for(:controller => "nl_contents", :action => "show", :id => "1").should == "/nl_contents/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "nl_contents", :action => "edit", :id => "1").should == "/nl_contents/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "nl_contents", :action => "create").should == {:path => "/nl_contents", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "nl_contents", :action => "update", :id => "1").should == {:path =>"/nl_contents/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "nl_contents", :action => "destroy", :id => "1").should == {:path =>"/nl_contents/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/nl_contents").should == {:controller => "nl_contents", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/nl_contents/new").should == {:controller => "nl_contents", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/nl_contents").should == {:controller => "nl_contents", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/nl_contents/1").should == {:controller => "nl_contents", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/nl_contents/1/edit").should == {:controller => "nl_contents", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/nl_contents/1").should == {:controller => "nl_contents", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/nl_contents/1").should == {:controller => "nl_contents", :action => "destroy", :id => "1"}
    end
  end
end
