require 'spec_helper'

describe "descriptions/new" do
  before(:each) do
    assign(:description, stub_model(Description).as_new_record)
  end

  it "renders new description form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => descriptions_path, :method => "post" do
    end
  end
end
