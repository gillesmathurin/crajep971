class CreateEvenements < ActiveRecord::Migration
  def self.up
    create_table :evenements do |t|
      t.string :titre
      t.date :date
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :evenements
  end
end
