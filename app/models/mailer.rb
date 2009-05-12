class Mailer < ActionMailer::Base
  
  # Envoi les données du formulaire de demande d'adhésion
  def candidature(candidature)
    subject "Demande d'adhésion"
    from "postmaster@crajep-temp.com"
    recipients "gillesmath@me.com"
    cc ['agouti4@wanadoo.fr', 'gilbert.sacile@orange.fr', 'bruno.benony@gmail.com' ]
    body :candidature => candidature
    sent_on Time.now
    charset "iso-8859-1"
    content_type "text/html"
  end
  
end