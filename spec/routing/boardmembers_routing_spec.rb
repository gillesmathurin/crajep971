require 'spec_helper'

describe BoardmembersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/boardmembers" }.should route_to(:controller => "boardmembers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/boardmembers/new" }.should route_to(:controller => "boardmembers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/boardmembers/1" }.should route_to(:controller => "boardmembers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/boardmembers/1/edit" }.should route_to(:controller => "boardmembers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/boardmembers" }.should route_to(:controller => "boardmembers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/boardmembers/1" }.should route_to(:controller => "boardmembers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/boardmembers/1" }.should route_to(:controller => "boardmembers", :action => "destroy", :id => "1") 
    end
  end
end
