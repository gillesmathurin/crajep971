require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Evenement do
  before(:each) do
    @valid_attributes = {
      :titre => "value for titre",
      :date => Date.today,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Evenement.create!(@valid_attributes)
  end
end
