require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Candidature do
  before(:each) do
    @valid_attributes = {
      :nom_asso => "value for nom_asso",
      :adresse => "value for adresse",
      :cp => "value for cp",
      :ville => "value for ville",
      :tel => "value for tel",
      :fax => "value for fax",
      :email => "value for email",
      :nom_contact => "value for nom_contact",
      :tel_contact => "value for tel_contact",
      :objet => "value for objet"
    }
  end

  it "should create a new instance given valid attributes" do
    Candidature.create!(@valid_attributes)
  end
end
