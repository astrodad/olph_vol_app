class VolunteerEventsController < ApplicationController

	

	respond_to	:html, :js

	include SessionsHelper

	def create

		puts params[:volunteer_event]

		@account = Account.find(params[:account])
		@worker = Worker.find(params[:worker])
		@event = @worker.VolunteerEvents.build(params[:volunteer_event])
		
		if admin_account?
			@event.user_update = false
		else
			@event.user_update = true
		end

		hours = @event.hour_worked
		minutes = @event.minute_worked

		@event.hours_worked = (@event.hour_worked.to_i * 3600) + (@event.minute_worked.to_i * 60)	##Need to tweak this

		
		desc = Description.find(params[:name])
		@event.name = desc.name

		
		if @event.save
			flash[:success] = "Hours posted for " + @event.name + "!"
		else 
			flash[:error] = @event.errors.full_messages.to_sentence
		end

		redirect_to @account

	end

	def destroy
		#This should usually respond to JS since we don't have code to use it via HTML.
		@volunteer_event = VolunteerEvent.find(params[:id])
		@volunteer_event.destroy

		respond_with(@volunteer_event) 
     
	end

end
