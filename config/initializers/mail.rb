# TODO : replace this when the domain name will be bought
ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.sendmail_settings = {
 :location       => '/usr/sbin/sendmail',
 :arguments      => '-i -t '
}                                                                                                                                                                                                                             
ActionMailer::Base.perform_deliveries = true                                                                                            
ActionMailer::Base.raise_delivery_errors = true                                                                                           
ActionMailer::Base.default_charset = "utf-8"

# Configuration pour test en development
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = { 
#   :address => "mail.asso-guadeloupe.fr", 
#   :port => 26, 
#   :domain => "asso-guadeloupe.fr",
#   :authentication => :login, 
#   :user_name => "gilles+asso-guadeloupe.fr", 
#   :password => "$rv+&c77ul&9"
# }
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.raise_delivery_errors = false
# ActionMailer::Base.default_charset = "iso-8859-1"