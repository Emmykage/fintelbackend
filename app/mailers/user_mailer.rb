class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.ConfirmationEmail.subject
  #
  def ConfirmationEmail
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.NotificationEmail.subject
  #
  def NotificationEmail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
