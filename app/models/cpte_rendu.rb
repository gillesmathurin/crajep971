class CpteRendu < ActiveRecord::Base
  has_attached_file :document
  
  validates_attachment_content_type("application/msword")
end
