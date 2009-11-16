require 'spec_helper'

describe "/boardmembers/index.html.erb" do
  include BoardmembersHelper

  before(:each) do
    assigns[:boardmembers] = [
      stub_model(Boardmember,
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
      ),
      stub_model(Boardmember,
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
      )
    ]
  end

  it "renders a list of boardmembers" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for fonction".to_s, 2)
    response.should have_tag("tr>td", "value for association".to_s, 2)
    response.should have_tag("tr>td", "value for adresse".to_s, 2)
    response.should have_tag("tr>td", "value for codepostal".to_s, 2)
    response.should have_tag("tr>td", "value for ville".to_s, 2)
    response.should have_tag("tr>td", "value for tel".to_s, 2)
    response.should have_tag("tr>td", "value for mob".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
