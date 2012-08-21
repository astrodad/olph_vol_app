require 'spec_helper'

describe "activities/new" do
  before(:each) do
    assign(:activity, stub_model(Activity,
      :activity => "MyString",
      :description => "MyString",
      :priority => false,
      :visible => false,
      :chair => "MyString"
    ).as_new_record)
  end

  it "renders new activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activities_path, :method => "post" do
      assert_select "input#activity_activity", :name => "activity[activity]"
      assert_select "input#activity_description", :name => "activity[description]"
      assert_select "input#activity_priority", :name => "activity[priority]"
      assert_select "input#activity_visible", :name => "activity[visible]"
      assert_select "input#activity_chair", :name => "activity[chair]"
    end
  end
end
