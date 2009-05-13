require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/newsletters/edit.html.erb" do
  include NewslettersHelper
  
  before(:each) do
    assigns[:newsletter] = @newsletter = stub_model(Newsletter,
      :new_record? => false,
      :titre => "value for titre"
    )
  end

  it "renders the edit newsletter form" do
    render
    
    response.should have_tag("form[action=#{newsletter_path(@newsletter)}][method=post]") do
      with_tag('input#newsletter_titre[name=?]', "newsletter[titre]")
    end
  end
end


