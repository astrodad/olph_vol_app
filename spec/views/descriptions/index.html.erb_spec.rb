require 'spec_helper'

describe "descriptions/index" do
  before(:each) do
    assign(:descriptions, [
      stub_model(Description),
      stub_model(Description)
    ])
  end

  it "renders a list of descriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
