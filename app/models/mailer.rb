class Mailer < ActionMailer::Base
  
  # Envoi les données du formulaire de demande d'adhésion
  def candidature(candidature)
    subject "Demande d'adhésion"
    from "postmaster@crajep-temp.com"
    recipients "gillesmath@me.com"
    cc ['agouti4@wanadoo.fr', 'gilbert.sacile@orange.fr', 'bruno.benony@gmail.com', 'crajep971@orange.fr' ]
    body :candidature => candidature
    sent_on Time.now
    charset "iso-8859-1"
  end
  
  def newsletter(abonnes, newsletter)
    subject "CRAJEP Lettre d'information n°#{newsletter.id}"
    from "postmaster@crajep-temp.com"
    body :newsletter => newsletter
    recipients(abonnes.first.email)
    bcc abonnes.map(&:email)
    sent_on Time.now
    # headers {}
    charset 'UTF-8'
    content_type "text/html"
  end
  
  def confirm_newsletter_sub(abonne)
    @subject = "Confirmation de votre abonnement à notre newsletter"
    @body = { "abonne" => abonne }
    from "postmaster@guadeloupe-asso.fr"
    @recipients = abonne.email_abonne
    @sent_on = Time.now
    @header = {}
    @charset = 'UTF-8'
  end
end