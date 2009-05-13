class AddTitreColumnToNlContents < ActiveRecord::Migration
  def self.up
    add_column :nl_contents, :titre, :string
  end

  def self.down
    remove_column :nl_contents, :titre
  end
end
