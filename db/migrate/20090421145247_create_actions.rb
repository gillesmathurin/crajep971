class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.string :nom
      t.text :description
      t.string :nom_lien
      t.string :lien
      t.integer :categorie_action_id

      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
