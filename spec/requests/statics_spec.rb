require 'spec_helper'

describe "Static pages" do

	subject {page}

  describe "Home page" do
  	before {visit root_path}

  	it {should have_selector('h1', text: 'OLPH School Volunteer Center')}


  end

	describe "Help page" do
 		before {visit help_path}

 		it {should have_selector('h1', text: 'OLPH School Volunteer Center Help')}
 	end

  
end