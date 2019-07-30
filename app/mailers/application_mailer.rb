class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <aleksander.zimin@gmail.com>}
  layout 'mailer'
end
