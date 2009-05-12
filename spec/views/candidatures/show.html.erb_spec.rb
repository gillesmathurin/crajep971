require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/candidatures/show.html.erb" do
  include CandidaturesHelper
  before(:each) do
    assigns[:candidature] = @candidature = stub_model(Candidature,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom_asso/)
    response.should have_text(/value\ for\ adresse/)
    response.should have_text(/value\ for\ cp/)
    response.should have_text(/value\ for\ ville/)
    response.should have_text(/value\ for\ tel/)
    response.should have_text(/value\ for\ fax/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ nom_contact/)
    response.should have_text(/value\ for\ tel_contact/)
    response.should have_text(/value\ for\ objet/)
  end
end

