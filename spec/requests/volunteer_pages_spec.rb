require 'spec_helper'

describe "VolunteerPages" do
 
	subject {page}

	describe "account home page" do

		let(:account) { FactoryGirl.create(:account) }
		
		
		describe "should show workers" do

			before do
				@worker = account.workers.build(name: "Bob the tester")
				@worker.save
				@worker2 = account.workers.build(name: "Billy the kid")
				@worker2.save
				sign_in account
				visit account_path(account)
			end

			it {should have_selector('span', id: 'WorkerCount')}
			it {should have_selector('li', text:@worker.name)}
			it {should have_selector('li', text:@worker2.name)}
			
		end


		describe "volunteer event creation" do
			before do
				@worker = account.workers.build(name: "Bob the tester")
				@worker.save
				@worker2 = account.workers.build(name: "Billy the kid")
				@worker2.save
				sign_in account
				visit account_path(account)
			end

			describe "with invalid information" do
				it "should not create an event report" do
					expect {click_button "Post"}.should_not change(VolunteerEvent, :count).by(1)
				end
			end
			
			describe "error message" do
				before {click_button "Post"}
				it {should have_content('error')}
			end

			describe "with valid information" do
				before do
					
					fill_in 'volunteer_event_name', with: 'Slave labor'
					fill_in 'volunteer_event_date', with: '01/10/2012'
					selects @worker.name, from: "worker"
					fill_in 'Hours Worked', with: 2
				end

				it "should create a event report" do
					expect {click_button 'Post'}.should change(VolunteerEvent, :count).by(1)
				end

			end
		end


	end

end
