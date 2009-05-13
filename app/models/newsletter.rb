class Newsletter < ActiveRecord::Base
  has_many :nl_contents, :dependent => :destroy
end
