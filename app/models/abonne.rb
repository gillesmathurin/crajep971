class Abonne < ActiveRecord::Base
  validates_presence_of :email, :on => :create, :message => "doit être présent"
  validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, :on => :create, :message => "n'est pas valide"
end
