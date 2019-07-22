class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <alexzimin@mail.ru>}
  layout 'mailer'
end
