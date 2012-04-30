class SessionsController < ApplicationController

	include SessionsHelper

	def new
	end

	def create
		account = Account.find_by_email(params[:session][:email])
		if account && account.authenticate(params[:session][:password])
			sign_in account
			redirect_back_or account
		else
			flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

	
end
