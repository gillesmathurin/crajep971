require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/nl_contents/new.html.erb" do
  include NlContentsHelper
  
  before(:each) do
    assigns[:nl_content] = stub_model(NlContent,
      :new_record? => true,
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => "value for image_file_size"
    )
  end

  it "renders new nl_content form" do
    render
    
    response.should have_tag("form[action=?][method=post]", nl_contents_path) do
      with_tag("input#nl_content_image_file_name[name=?]", "nl_content[image_file_name]")
      with_tag("input#nl_content_image_content_type[name=?]", "nl_content[image_content_type]")
      with_tag("input#nl_content_image_file_size[name=?]", "nl_content[image_file_size]")
    end
  end
end


