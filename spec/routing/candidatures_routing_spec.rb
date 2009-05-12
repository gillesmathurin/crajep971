require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CandidaturesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "candidatures", :action => "index").should == "/candidatures"
    end
  
    it "maps #new" do
      route_for(:controller => "candidatures", :action => "new").should == "/candidatures/new"
    end
  
    it "maps #show" do
      route_for(:controller => "candidatures", :action => "show", :id => "1").should == "/candidatures/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "candidatures", :action => "edit", :id => "1").should == "/candidatures/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "candidatures", :action => "create").should == {:path => "/candidatures", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "candidatures", :action => "update", :id => "1").should == {:path =>"/candidatures/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "candidatures", :action => "destroy", :id => "1").should == {:path =>"/candidatures/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/candidatures").should == {:controller => "candidatures", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/candidatures/new").should == {:controller => "candidatures", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/candidatures").should == {:controller => "candidatures", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/candidatures/1").should == {:controller => "candidatures", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/candidatures/1/edit").should == {:controller => "candidatures", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/candidatures/1").should == {:controller => "candidatures", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/candidatures/1").should == {:controller => "candidatures", :action => "destroy", :id => "1"}
    end
  end
end
