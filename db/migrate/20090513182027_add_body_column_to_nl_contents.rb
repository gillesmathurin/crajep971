class AddBodyColumnToNlContents < ActiveRecord::Migration
  def self.up
    add_column :nl_contents, :body, :text
  end

  def self.down
    remove_column :nl_contents, :body
  end
end
