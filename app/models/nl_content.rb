class NlContent < ActiveRecord::Base
  belongs_to :newsletter
  
  has_attached_file :image, :styles => { :thumb => "100x100>" }
end
