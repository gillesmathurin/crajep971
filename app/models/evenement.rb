class Evenement < ActiveRecord::Base
  named_scope :of_the_month, :conditions => ['date between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month]  
end
