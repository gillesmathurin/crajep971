require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/nl_contents/show.html.erb" do
  include NlContentsHelper
  before(:each) do
    assigns[:nl_content] = @nl_content = stub_model(NlContent,
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => "value for image_file_size"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ image_file_name/)
    response.should have_text(/value\ for\ image_content_type/)
    response.should have_text(/value\ for\ image_file_size/)
  end
end

