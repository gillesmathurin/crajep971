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

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = { 
  :address => "mail.crajep-temp.com", 
  :port => 26, 
  :domain => "crajep-temp.com",
  :authentication => :login, 
  :user_name => "postmaster+crajep-temp.com", 
  :password => "zFDLm4R1jKuT"
}
ActionMailer::Base.perform_deliveries = true # TODO set to true for production
ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.default_charset = "iso-8859-1"