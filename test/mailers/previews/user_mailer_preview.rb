# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/ConfirmationEmail
  def ConfirmationEmail
    UserMailer.ConfirmationEmail
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/NotificationEmail
  def NotificationEmail
    UserMailer.NotificationEmail
  end

end
