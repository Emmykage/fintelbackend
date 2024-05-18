class LogInNotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    if user.email.downcase == "nathandevlin91@live.com.au"
      # UserMailer.login_special(user).deliver_later
      # puts "hey"
    else
      UserMailer.login_notification(user).deliver_later
    end
  end
end
