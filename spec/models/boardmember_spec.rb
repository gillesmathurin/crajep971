require 'spec_helper'

describe Boardmember do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :fonction => "value for fonction",
      :association => "value for association",
      :adresse => "value for adresse",
      :codepostal => "value for codepostal",
      :ville => "value for ville",
      :tel => "value for tel",
      :mob => "value for mob",
      :email => "value for email",
      :contact => false
    }
  end

  it "should create a new instance given valid attributes" do
    Boardmember.create!(@valid_attributes)
  end
end
