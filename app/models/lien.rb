class Lien < ActiveRecord::Base
  validates_presence_of :nom, :adresse, :on => :create, :message => "doit être rempli(e)"
  default_scope :order => 'created_at desc'
end
