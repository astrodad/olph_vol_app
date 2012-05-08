class StaticPagesController < ApplicationController
	
	include SessionsHelper
  
  before_filter :signed_in_account, only: [:home]

  def home

  	if signed_in? 
			redirect_to current_account
		end	

  end

  def help
  end
end
