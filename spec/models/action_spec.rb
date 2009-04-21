require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Action do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :description => "value for description",
      :nomlien => "value for nomlien",
      :lien => "value for lien",
      :categorie_action_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Action.create!(@valid_attributes)
  end
end
