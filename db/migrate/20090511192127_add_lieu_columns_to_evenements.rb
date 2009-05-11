class AddLieuColumnsToEvenements < ActiveRecord::Migration
  def self.up
    add_column :evenements, :lieu, :string
  end

  def self.down
    remove_column :evenements, :lieu
  end
end
