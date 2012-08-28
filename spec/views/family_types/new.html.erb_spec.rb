require 'spec_helper'

describe "family_types/new" do
  before(:each) do
    assign(:family_type, stub_model(FamilyType).as_new_record)
  end

  it "renders new family_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => family_types_path, :method => "post" do
    end
  end
end
