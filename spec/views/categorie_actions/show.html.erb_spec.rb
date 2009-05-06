require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categorie_actions/show" do
  before(:each) do
    render 'categorie_actions/show'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/categorie_actions/show])
  end
end
