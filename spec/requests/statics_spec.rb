require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'OLPH School Volunteer Center'" do
      visit '/static_pages/home'
      page.should have_content('OLPH School Volunteer Center')
    end
  end
end