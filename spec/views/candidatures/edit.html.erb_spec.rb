require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidatures/edit.html.erb" do
  include CandidaturesHelper
  
  before(:each) do
    assigns[:candidature] = @candidature = stub_model(Candidature,
      :new_record? => false,
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
    )
  end

  it "renders the edit candidature form" do
    render
    
    response.should have_tag("form[action=#{candidature_path(@candidature)}][method=post]") do
      with_tag('input#candidature_nom_asso[name=?]', "candidature[nom_asso]")
      with_tag('input#candidature_adresse[name=?]', "candidature[adresse]")
      with_tag('input#candidature_cp[name=?]', "candidature[cp]")
      with_tag('input#candidature_ville[name=?]', "candidature[ville]")
      with_tag('input#candidature_tel[name=?]', "candidature[tel]")
      with_tag('input#candidature_fax[name=?]', "candidature[fax]")
      with_tag('input#candidature_email[name=?]', "candidature[email]")
      with_tag('input#candidature_nom_contact[name=?]', "candidature[nom_contact]")
      with_tag('input#candidature_tel_contact[name=?]', "candidature[tel_contact]")
      with_tag('textarea#candidature_objet[name=?]', "candidature[objet]")
    end
  end
end


