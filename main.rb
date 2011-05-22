Dir["lib/**/*.rb"].sort.each { |file| require(File.dirname(__FILE__) + "/"+ file) }

require 'rubygems'
require 'action_mailer'
require "net/smtp"

p "Enter the path of the Yaml file"
yaml_path = gets() 

site_status = SiteStatus.new(yaml_path.strip)
p "loading ... "
if site_status.site_xpath_yaml.nil?
p "File not found in the given path"
else
p site_status.start_testing
end
# 
# puts 
# 
# begin
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
  # :address              => "smtp.gmail.com",
  # :port                 => '25',
  # :domain               => "gmail.com",
  # :user_name            => 'surendrans86@gmail.com',
  # :password             => "Rajini123",
  # :authentication       => 'plain',
  # :enable_starttls_auto => true  }
# 
# #SendMail.deliver_message()
    # rescue Exception=>e
      # puts e,"=================="
    # end
     

