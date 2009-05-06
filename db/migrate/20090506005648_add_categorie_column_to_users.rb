class AddCategorieColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :categorie, :string
  end

  def self.down
    remove_column :users, :categorie
  end
end
