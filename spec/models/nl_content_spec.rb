require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NlContent do
  before(:each) do
    @valid_attributes = {
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => "value for image_file_size",
      :image_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    NlContent.create!(@valid_attributes)
  end
end
