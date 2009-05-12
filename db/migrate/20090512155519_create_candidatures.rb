class CreateCandidatures < ActiveRecord::Migration
  def self.up
    create_table :candidatures do |t|
      t.string :nom_asso
      t.string :adresse
      t.string :cp
      t.string :ville
      t.string :tel
      t.string :fax
      t.string :email
      t.string :nom_contact
      t.string :tel_contact
      t.text :objet

      t.timestamps
    end
  end

  def self.down
    drop_table :candidatures
  end
end
