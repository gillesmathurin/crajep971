require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/nl_contents/index.html.erb" do
  include NlContentsHelper
  
  before(:each) do
    assigns[:nl_contents] = [
      stub_model(NlContent,
        :image_file_name => "value for image_file_name",
        :image_content_type => "value for image_content_type",
        :image_file_size => "value for image_file_size"
      ),
      stub_model(NlContent,
        :image_file_name => "value for image_file_name",
        :image_content_type => "value for image_content_type",
        :image_file_size => "value for image_file_size"
      )
    ]
  end

  it "renders a list of nl_contents" do
    render
    response.should have_tag("tr>td", "value for image_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for image_content_type".to_s, 2)
    response.should have_tag("tr>td", "value for image_file_size".to_s, 2)
  end
end

