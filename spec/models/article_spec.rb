require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Article do
  before(:each) do
    @valid_attributes = {
      :titre => "value for titre",
      :body => "value for body",
      :user_id => 1,
      :evenement_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Article.create!(@valid_attributes)
  end
end
