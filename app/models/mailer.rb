class Mailer < ActionMailer::Base
  
  # Envoi les données du formulaire de demande d'adhésion
  def candidature(candidature)
    subject "Demande d'adhésion"
    from "postmaster@crajep-temp.com"
    recipients "crajep971@orange.fr"
    cc ['agouti4@wanadoo.fr', 'gilbert.sacile@orange.fr', 'bruno.benony@gmail.com',
       'gillesmath@me.com' ]
    body :candidature => candidature
    sent_on Time.now
    charset "iso-8859-1"
  end
  
  def newsletter(abonnes, newsletter)
    subject "CRAJEP Lettre d'information n°#{newsletter.id}"
    from "postmaster@crajep-temp.com"
    recipients(abonnes.last.email)
    cc(abonnes.map(&:email))
    sent_on Time.now
    headers {}
    charset 'UTF-8'
    content_type "text/html"
    body :newsletter => newsletter
  end
  
  def confirm_newsletter_sub(abonne)
    @subject = "Confirmation de votre abonnement à notre newsletter"
    @body = { "abonne" => abonne }
    from "postmaster@guadeloupe-asso.fr"
    @recipients = abonne.email
    @sent_on = Time.now
    @header = {}
    @charset = 'UTF-8'
  end
  
  def cpterendu_notification(cpte_rendu, email_array)
    subject "Nouveau Compte rendu de réunion"
    from "postmaster@crajep_temp.com"
    recipients email_array
    part "text/plain" do |p|
      p.body = render_message("cpterendu_notification_plain", :cpte_rendu => cpte_rendu)
    end
    sent_on Time.now
    charset "iso-8859-1"
    attachment :content_type => "application/msword", :body => File.read(cpte_rendu.document.url)
  end
end