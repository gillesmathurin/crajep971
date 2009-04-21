require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Membre do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :description => "value for description",
      :adresse => "value for adresse",
      :cp => "value for cp",
      :ville => "value for ville",
      :tel => "value for tel",
      :fax => "value for fax",
      :weburl => "value for weburl"
    }
  end

  it "should create a new instance given valid attributes" do
    Membre.create!(@valid_attributes)
  end
end
