require 'spec_helper'

describe "Account Pages" do

	subject {page}

	describe "sign up page" do
		before {visit signup_path}


		it {should have_selector('h1', text:'Volunteer Account Registration')}
		it {should have_selector('title', text: full_title('Register'))}
	end


	describe "registration" do

		before {visit signup_path}
		let(:submit) {"Create our account"}

		describe "with invalid information" do	
			
		it "should not create an account" do
				expect {click_button submit}.not_to change(Account, :count)
			end
		end

		describe "with valid information" do


			before do
				fill_in "Name", 				with: "Example account"
				fill_in "Email", 				with: "test@test.com"
				fill_in "Password", 		with: "testtest"
				fill_in "Confirmation", with: "testtest"
			end

	
			it "should create an account" do
				expect {click_button submit}.to change(Account, :count).by(1)
			end

			describe "after saving account" do
				before { click_button submit }
        let(:account) { FactoryGirl.create(:account) }

        it { should have_selector('title', text: account.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }

        


			end


		end


	end


end
