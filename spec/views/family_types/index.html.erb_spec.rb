require 'spec_helper'

describe "family_types/index" do
  before(:each) do
    assign(:family_types, [
      stub_model(FamilyType),
      stub_model(FamilyType)
    ])
  end

  it "renders a list of family_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
