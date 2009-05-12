require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidatures/index.html.erb" do
  include CandidaturesHelper
  
  before(:each) do
    assigns[:candidatures] = [
      stub_model(Candidature,
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
      ),
      stub_model(Candidature,
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
    ]
  end

  it "renders a list of candidatures" do
    render
    response.should have_tag("tr>td", "value for nom_asso".to_s, 2)
    response.should have_tag("tr>td", "value for adresse".to_s, 2)
    response.should have_tag("tr>td", "value for cp".to_s, 2)
    response.should have_tag("tr>td", "value for ville".to_s, 2)
    response.should have_tag("tr>td", "value for tel".to_s, 2)
    response.should have_tag("tr>td", "value for fax".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for nom_contact".to_s, 2)
    response.should have_tag("tr>td", "value for tel_contact".to_s, 2)
    response.should have_tag("tr>td", "value for objet".to_s, 2)
  end
end

