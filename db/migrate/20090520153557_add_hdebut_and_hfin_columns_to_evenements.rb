class AddHdebutAndHfinColumnsToEvenements < ActiveRecord::Migration
  def self.up
    add_column :evenements, :hdebut, :time
    add_column :evenements, :hfin, :time
  end

  def self.down
    remove_column :evenements, :hfin
    remove_column :evenements, :hdebut
  end
end
