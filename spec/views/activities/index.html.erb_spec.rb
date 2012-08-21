require 'spec_helper'

describe "activities/index" do
  before(:each) do
    assign(:activities, [
      stub_model(Activity,
        :activity => "Activity",
        :description => "Description",
        :priority => false,
        :visible => false,
        :chair => "Chair"
      ),
      stub_model(Activity,
        :activity => "Activity",
        :description => "Description",
        :priority => false,
        :visible => false,
        :chair => "Chair"
      )
    ])
  end

  it "renders a list of activities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Chair".to_s, :count => 2
  end
end
