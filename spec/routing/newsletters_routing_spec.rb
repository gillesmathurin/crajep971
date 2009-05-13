require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NewslettersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "newsletters", :action => "index").should == "/newsletters"
    end
  
    it "maps #new" do
      route_for(:controller => "newsletters", :action => "new").should == "/newsletters/new"
    end
  
    it "maps #show" do
      route_for(:controller => "newsletters", :action => "show", :id => "1").should == "/newsletters/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "newsletters", :action => "edit", :id => "1").should == "/newsletters/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "newsletters", :action => "create").should == {:path => "/newsletters", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "newsletters", :action => "update", :id => "1").should == {:path =>"/newsletters/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "newsletters", :action => "destroy", :id => "1").should == {:path =>"/newsletters/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/newsletters").should == {:controller => "newsletters", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/newsletters/new").should == {:controller => "newsletters", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/newsletters").should == {:controller => "newsletters", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/newsletters/1").should == {:controller => "newsletters", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/newsletters/1/edit").should == {:controller => "newsletters", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/newsletters/1").should == {:controller => "newsletters", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/newsletters/1").should == {:controller => "newsletters", :action => "destroy", :id => "1"}
    end
  end
end
