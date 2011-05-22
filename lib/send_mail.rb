require 'rubygems'
require 'action_mailer'
require "net/smtp"

class SendMail < ActionMailer::Base
 default :from => "surendrans86@gmail.com"
def message()

    @url  = "http://example.com/login"
    mail(:to => "surendrans86@gmail.com",
         :subject => "Welcome to My Awesome Site")
  end

end
