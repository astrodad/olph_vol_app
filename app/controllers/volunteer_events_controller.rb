class VolunteerEventsController < ApplicationController

	include SessionsHelper

	def create

		@account = Account.find(params[:account])
		@worker = Worker.find(params[:worker])
		@event = @worker.VolunteerEvents.build(params[:volunteer_event])

		if @event.save
			flash[:success] = "Hours posted!"
		else 
			flash[:error] = @event.errors.full_messages.to_sentence
		end

		redirect_to @account

	end
end
