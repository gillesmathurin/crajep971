class CreateBoardmembers < ActiveRecord::Migration
  def self.up
    create_table :boardmembers do |t|
      t.string :nom
      t.string :fonction
      t.string :association
      t.string :adresse
      t.string :codepostal
      t.string :ville
      t.string :tel
      t.string :mob
      t.string :email
      t.boolean :contact, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :boardmembers
  end
end
