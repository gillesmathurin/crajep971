require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Action do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :description => "value for description",
      :nom_lien => "value for nom_lien",
      :lien => "value for lien",
      :categorie_action_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Action.create!(@valid_attributes)
  end
end
