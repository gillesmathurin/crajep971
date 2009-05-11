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

describe "Evenement .has_events_on?(day)" do
  fixtures :evenements
  
  before(:each) do
    @date = Date.today
    @date_with_events = '2009-04-21'
  end
  
  it "should tell if the there are evenement on the given day" do
    Evenement.has_events_on?(@date).should be_false
    Evenement.has_events_on?(@date_with_events).should be_true
  end
end
