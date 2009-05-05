require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CategorieAction do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :theme => "value for theme",
      :permalink => "value for permalink"
    }
  end

  it "should create a new instance given valid attributes" do
    CategorieAction.create!(@valid_attributes)
  end
end
