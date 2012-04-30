module SessionsHelper
	def sign_in(account)
    cookies.permanent[:remember_token] = account.remember_token
    current_account = account
  end

	def signed_in?
    !current_account.nil?
  end

  def current_account=(account)
    @current_account = account
  end

  def signed_in_account
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  def current_account
    @current_account ||= account_from_remember_token
  end

  def current_account?(account)
  	account == current_account
  end
  
  def sign_out
  	current_account = nil
  	cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  private

    def account_from_remember_token
      remember_token = cookies[:remember_token]
      Account.find_by_remember_token(remember_token) unless remember_token.nil?
    end

    def clear_return_to
      session.delete(:return_to)
    end


end
