require 'spec_helper'

describe "descriptions/edit" do
  before(:each) do
    @description = assign(:description, stub_model(Description))
  end

  it "renders the edit description form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => descriptions_path(@description), :method => "post" do
    end
  end
end
