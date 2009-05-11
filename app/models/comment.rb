class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  named_scope :last_five, :order => "created_at desc", :limit => 5
  
end
