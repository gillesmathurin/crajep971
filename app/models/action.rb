class Action < ActiveRecord::Base
  belongs_to :categorie_action
  
  default_scope :order => 'created_at desc' 
end
