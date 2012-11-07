class Notifier < ActionMailer::Base
  default from: "Real Thematics Team <realteam@realthematics.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.registration_succeed.subject
  #
  def registration_succeed(user)
    @user = user

    mail to: user.email, :subject => 'Welcome to Real Thematics'
  end

  def reset_password(user)
    @user = user

    mail to: user.email, :subject => 'Instructions for resetting password of Real Thematics'
  end
end
