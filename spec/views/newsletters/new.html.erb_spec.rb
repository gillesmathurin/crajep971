require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/newsletters/new.html.erb" do
  include NewslettersHelper
  
  before(:each) do
    assigns[:newsletter] = stub_model(Newsletter,
      :new_record? => true,
      :titre => "value for titre"
    )
  end

  it "renders new newsletter form" do
    render
    
    response.should have_tag("form[action=?][method=post]", newsletters_path) do
      with_tag("input#newsletter_titre[name=?]", "newsletter[titre]")
    end
  end
end


