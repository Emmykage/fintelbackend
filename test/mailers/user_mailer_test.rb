require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "ConfirmationEmail" do
    mail = UserMailer.ConfirmationEmail
    assert_equal "Confirmationemail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "NotificationEmail" do
    mail = UserMailer.NotificationEmail
    assert_equal "Notificationemail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
