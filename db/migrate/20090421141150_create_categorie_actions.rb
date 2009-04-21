class CreateCategorieActions < ActiveRecord::Migration
  def self.up
    create_table :categorie_actions do |t|
      t.string :nom
      t.text :theme
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :categorie_actions
  end
end
