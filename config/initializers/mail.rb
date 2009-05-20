# TODO : replace this when the domain name will be bought
ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.sendmail_settings = {
 :location       => '/usr/sbin/sendmail',
 :arguments      => '-i -t '
}                                                                                                                                                                                                                             
ActionMailer::Base.perform_deliveries = true                                                                                            
ActionMailer::Base.raise_delivery_errors = true                                                                                           
ActionMailer::Base.default_charset = "utf-8"