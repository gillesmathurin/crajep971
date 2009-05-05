class CreateMembres < ActiveRecord::Migration
  def self.up
    create_table :membres do |t|
      t.string :nom
      t.text :description
      t.string :adresse
      t.string :cp
      t.string :ville
      t.string :tel
      t.string :fax
      t.string :weburl

      t.timestamps
    end
  end

  def self.down
    drop_table :membres
  end
end
