class CpteRendu < ActiveRecord::Base
  has_attached_file :document
    
  validates_attachment_content_type :document, :content_type => "application/msword",
   :message => "doit être un document word"
   
  def deliver(email_array)
    Mailer.deliver_cpterendu_notification(self, email_array)
    update_attribute(:published_at, Time.now)
  end
end
