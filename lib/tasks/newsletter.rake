desc "Send Newsletter"
task :send_newsletter => :environment do
  @abonnes = Abonne.find(:all, :select => :email)
  @newsletter = Newsletter.find(ENV["NEWSLETTER_ID"])
  @newsletter.deliver(@abonnes)
end