class Newsletter < ActiveRecord::Base
  has_many :nl_contents, :dependent => :destroy
  
  accepts_nested_attributes_for :nl_contents, :allow_destroy => true
  
  def deliver()
    abonnes = Abonne.all(:select => :email)
    Mailer.deliver_newsletter(abonnes, self)
    update_attribute(:published_at, Time.now) 
  end
end
