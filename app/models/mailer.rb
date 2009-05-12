class Mailer < ActionMailer::Base
  
  def candidature(candidature)
    subject "Demande d'adhésion"
    from "postmaster@451cra.lucian.hostingrails.com"
    recipients "gwadaman30@gmail.com"
    cc 'agouti4@wanadoo.fr'
    body :candidature => candidature
    sent_on Time.now
    charset 'UTF-8'
    content_type "text/html"
  end
end