require 'spec_helper'

describe "activities/show" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :activity => "Activity",
      :description => "Description",
      :priority => false,
      :visible => false,
      :chair => "Chair"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Activity/)
    rendered.should match(/Description/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Chair/)
  end
end
