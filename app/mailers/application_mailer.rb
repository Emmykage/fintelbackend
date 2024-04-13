class ApplicationMailer < ActionMailer::Base
  default from: "support@fintelvalues.com"
  @admin_email = "admin@fintelvalues.com"
  layout "mailer"
end
