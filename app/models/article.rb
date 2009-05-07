class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  named_scope :of_the_month, :conditions => ['created_at between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month]
  
end
