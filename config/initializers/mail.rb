# TODO : replace this when the domain name will be bought
ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.sendmail_settings = {
 :location       => '/usr/sbin/sendmail',
 :arguments      => '-i -t '
}                                                                                                                                                                                                                             
ActionMailer::Base.perform_deliveries = true                                                                                            
ActionMailer::Base.raise_delivery_errors = true                                                                                           
ActionMailer::Base.default_charset = "utf-8"

# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = { 
#   :address => "mail.451cra.lucian.hostingrails.com", 
#   :port => 26, 
#   :domain => "451cra.lucian.hostingrails.com",
#   :authentication => :login, 
#   :user_name => "postmaster+451cra.lucian.hostingrails.com", 
#   :password => "glvMkDz95q7J"
# }
# ActionMailer::Base.perform_deliveries = true # TODO set to true for production
# ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.default_charset = "iso-8859-1"
