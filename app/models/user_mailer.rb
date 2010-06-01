class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += "Veuillez activer votre compte d'utilisateur s'il vous plait"
  
    @body[:url]  = host + "/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = host
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "gwadaman30@gmail.com"
      @subject     = "[#{host}] "
      @sent_on     = Time.now
      @body[:user] = user
    end
    
    def host
      (Rails.env == "development") ? "http://localhost:3000" : "http://www.crajep971.fr"
    end
end
