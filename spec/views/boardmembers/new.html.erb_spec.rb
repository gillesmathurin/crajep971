require 'spec_helper'

describe "/boardmembers/new.html.erb" do
  include BoardmembersHelper

  before(:each) do
    assigns[:boardmember] = stub_model(Boardmember,
      :new_record? => true,
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
  end

  it "renders new boardmember form" do
    render

    response.should have_tag("form[action=?][method=post]", boardmembers_path) do
      with_tag("input#boardmember_nom[name=?]", "boardmember[nom]")
      with_tag("input#boardmember_fonction[name=?]", "boardmember[fonction]")
      with_tag("input#boardmember_association[name=?]", "boardmember[association]")
      with_tag("input#boardmember_adresse[name=?]", "boardmember[adresse]")
      with_tag("input#boardmember_codepostal[name=?]", "boardmember[codepostal]")
      with_tag("input#boardmember_ville[name=?]", "boardmember[ville]")
      with_tag("input#boardmember_tel[name=?]", "boardmember[tel]")
      with_tag("input#boardmember_mob[name=?]", "boardmember[mob]")
      with_tag("input#boardmember_email[name=?]", "boardmember[email]")
      with_tag("input#boardmember_contact[name=?]", "boardmember[contact]")
    end
  end
end
