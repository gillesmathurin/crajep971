class CpteRenduObserver < ActiveRecord::Observer
  
  def after_create(cpte_rendu)
    email_array = []
    # Fetch the Crajep associations emails
    associations = Association.find_the_crajep_one
    associations.each do |asso|
      email_array << asso.email
    end
    # Fetch the Membre emails
    membres = Membre.all(:select => "email")
    membres.each do |membre|
      email_array << membre.email
    end
    # deliver the compte_rendu to the recipients
    Mailer.deliver_cpterendu_notification(cpte_rendu, email_array)
  end
  
end