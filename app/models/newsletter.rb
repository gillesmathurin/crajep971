class Newsletter < ActiveRecord::Base
  has_many :nl_contents, :dependent => :destroy
  
  accepts_nested_attributes_for :nl_contents, :allow_destroy => true
end
