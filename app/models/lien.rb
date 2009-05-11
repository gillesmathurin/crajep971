class Lien < ActiveRecord::Base
  validates_presence_of :nom, :adresse, :on => :create, :message => "can't be blank"
  default_scope :order => 'created_at desc'
end
