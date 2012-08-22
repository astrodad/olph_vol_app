require 'spec_helper'

describe "family_types/edit" do
  before(:each) do
    @family_type = assign(:family_type, stub_model(FamilyType))
  end

  it "renders the edit family_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => family_types_path(@family_type), :method => "post" do
    end
  end
end
