class Membre < ActiveRecord::Base
  validates_presence_of :nom, :adresse, :cp, :ville, :tel, :on => :create, :message => "doit être renseigné"
end
