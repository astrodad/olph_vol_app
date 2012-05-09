class UserMailer < ActionMailer::Base
  default from: "admin-volunteer@olphschool.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(account)
    @account = account
    mail to: @account.email

  end
end
