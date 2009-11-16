require 'spec_helper'

describe "/boardmembers/show.html.erb" do
  include BoardmembersHelper
  before(:each) do
    assigns[:boardmember] = @boardmember = stub_model(Boardmember,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ fonction/)
    response.should have_text(/value\ for\ association/)
    response.should have_text(/value\ for\ adresse/)
    response.should have_text(/value\ for\ codepostal/)
    response.should have_text(/value\ for\ ville/)
    response.should have_text(/value\ for\ tel/)
    response.should have_text(/value\ for\ mob/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/false/)
  end
end
