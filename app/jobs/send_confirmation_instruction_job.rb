class SendConfirmationInstructionJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later

    UserMailer.ConfirmationEmail(user).deliver_now
    UserMailer.NotificationEmail(user).deliver_later
  end
end
