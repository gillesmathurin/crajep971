require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/newsletters/index.html.erb" do
  include NewslettersHelper
  
  before(:each) do
    assigns[:newsletters] = [
      stub_model(Newsletter,
        :titre => "value for titre"
      ),
      stub_model(Newsletter,
        :titre => "value for titre"
      )
    ]
  end

  it "renders a list of newsletters" do
    render
    response.should have_tag("tr>td", "value for titre".to_s, 2)
  end
end

