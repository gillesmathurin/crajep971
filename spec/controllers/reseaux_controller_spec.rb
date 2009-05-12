require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReseauxController do

  #Delete these examples and add some real ones
  it "should use ReseauxController" do
    controller.should be_an_instance_of(ReseauxController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'nex'" do
    it "should be successful" do
      get 'nex'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end
end
