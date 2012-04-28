require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
  	before {visit root_path}

  	it {should have_selector('h1', text:'OLPH School Volunteer Center')}


    end

 


  
end