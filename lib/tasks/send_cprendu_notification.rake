desc "Send CpteRendu Notification"
task :send_cprendu_notification => :environment do
  logger = Logger.new("#{RAILS_ROOT}/log/rake.log")
  @email_array = []
  
  # Fetch the Crajep associations emails
  begin
    @associations = Association.find_the_crajep_ones
    @associations.each do |asso|
      @email_array << asso.email
    end      
  rescue ActiveResource::ResourceNotFound, ActiveResource::ServerError,
     ActiveResource::ConnectionError, SocketError
  end
  
  
  # Fetch the Membre emails
  membres = Membre.all(:select => "email")
  membres.each do |membre|
    @email_array << membre.email
  end
  logger.info("Liste des emails récupérés : #{@email_array.inspect}")
  
  @cpte_rendu = CpteRendu.find(ENV["CPTE_RENDU_ID"])
  @cpte_rendu.deliver(@email_array) unless @email_array.empty?
end