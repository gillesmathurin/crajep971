require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Newsletter do
  before(:each) do
    @valid_attributes = {
      :published_at => Time.now,
      :titre => "value for titre"
    }
  end

  it "should create a new instance given valid attributes" do
    Newsletter.create!(@valid_attributes)
  end
end
