class Mailer < ActionMailer::Base
  
  # Envoi les données du formulaire de demande d'adhésion
  def candidature(candidature)
    subject "Demande d'adhésion"
    from "postmaster@crajep971.fr"
    recipients "crajep971@orange.fr"
    cc ['agouti4@wanadoo.fr', 'gilbert.sacile@orange.fr', 'bruno.benony@gmail.com',
       'gillesmath@me.com' ]
    body :candidature => candidature
    sent_on Time.now
    charset "iso-8859-1"
  end
  
  def newsletter(abonnes, newsletter)
    subject "CRAJEP Lettre d'information n°#{newsletter.id}"
    from "postmaster@crajep971.fr"
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
    from "postmaster@crajep971.fr"
    @recipients = abonne.email
    @sent_on = Time.now
    @header = {}
    @charset = 'UTF-8'
  end
  
  def cpterendu_notification(cpte_rendu, emails)
    subject "Nouveau Compte rendu de réunion"
    from "postmaster@crajep971.fr"
    recipients emails 
    body :cpte_rendu => cpte_rendu
    sent_on Time.now
    charset "iso-8859-1"
  end
  
  # private
  # 
  # def prepare_recipients_for_cpterendu
  #   email_array = []
  #   # Fetch the Crajep associations emails
  #   associations = Association.find_the_crajep_ones
  #   associations.each do |asso|
  #     email_array << asso.email
  #   end
  #   # Fetch the Membre emails
  #   membres = Membre.all(:select => "email")
  #   membres.each do |membre|
  #     email_array << membre.email
  #   end
  #   return email_array
  # end
  
end