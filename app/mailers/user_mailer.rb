class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.ConfirmationEmail.subject
  #
  def confirmation_email(user)
    admin = "support@fintelvalues.com"
    @user = user
    @url = confirmation_url(user.confirmation_token)

    mail(to: [admin, @user.email ], subject: "Email Confirmation" )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.NotificationEmail.subject
  #
  def NotificationEmail
    @greeting = "Hi"

    mail(to: @admin_email, subject: "New User")
  end

  private
  def confirmation_url(confirmation_token)
    "#{Rails.application.config.action_mailer.default_url_options[:host]}/confirm_email?confirmation_token=#{confirmation_token}"

  end


end
