desc "Send Newsletter"
task :send_newsletter => :environment do
  logger = Logger.new("#{RAILS_ROOT}/log/rake.log")
  @abonnes = Abonne.find(:all, :select => :email)
  # @abonnes = "gwadaman30@gmail.com"
  logger.info("Liste des emails récupérés : #{@abonnes.inspect}")
  @newsletter = Newsletter.find(ENV["NEWSLETTER_ID"])
  @newsletter.deliver(@abonnes) unless @abonnes.nil?
end