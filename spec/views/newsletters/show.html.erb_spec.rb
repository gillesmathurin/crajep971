require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/newsletters/show.html.erb" do
  include NewslettersHelper
  before(:each) do
    assigns[:newsletter] = @newsletter = stub_model(Newsletter,
      :titre => "value for titre"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ titre/)
  end
end

