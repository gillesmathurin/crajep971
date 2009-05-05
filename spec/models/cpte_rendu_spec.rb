require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CpteRendu do
  before(:each) do
    @valid_attributes = {
      :titre => "value for titre",
      :published_at => Time.now,
      :body => "value for body",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CpteRendu.create!(@valid_attributes)
  end
end
