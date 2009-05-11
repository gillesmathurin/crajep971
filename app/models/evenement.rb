class Evenement < ActiveRecord::Base
  named_scope :of_the_month, :conditions => ['date between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month]  
  
  # Tell wether or not there are events on the given day
  def self.has_events_on?(day)
    if find(:all, :conditions => ['date = ?', day]).empty?
      return false
    else
      return true
    end
  end
  
end
