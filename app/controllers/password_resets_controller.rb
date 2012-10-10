class PasswordResetsController < ApplicationController
  
  def new

  end



  def create
    #Fixing defect found when user inputs email with uppercase in password rest
    account = Account.where('lower(email) = ?' , params[:email].downcase).first

    if account.nil?
      flash[:error] = "No account found with that email address. Please check it and try again."
      redirect_to new_password_reset_path
    else
      account.send_password_reset if account
      flash[:success] = "Email sent with password reset instructions."
      redirect_to pass_reset_path
    end
  end

  def edit
  	@account = Account.find_by_password_reset_token!(params[:id])
  end

  def update

  	@account = Account.find_by_password_reset_token!(params[:id])
  	@account.updating_password = true

  	if @account.password_reset_sent_at < 2.hours.ago
  		flash[:error] = "Password reset has expired."
    	redirect_to new_password_reset_path
  	elsif @account.update_attributes(params[:account])
  		flash[:success] = "Password has been reset. Please login."
    	redirect_to signin_path
  	else
    	render :edit
  	end
  end

end
