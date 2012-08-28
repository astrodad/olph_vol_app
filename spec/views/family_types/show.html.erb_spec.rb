require 'spec_helper'

describe "family_types/show" do
  before(:each) do
    @family_type = assign(:family_type, stub_model(FamilyType))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
