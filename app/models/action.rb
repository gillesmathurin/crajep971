class Action < ActiveRecord::Base
  belongs_to :categorie_action
  
  default_scope :order => 'created_at desc'
  
  named_scope :last_3, :limit => 3
   
end
