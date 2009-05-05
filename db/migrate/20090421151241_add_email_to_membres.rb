class AddEmailToMembres < ActiveRecord::Migration
  def self.up
    add_column :membres, :email, :string
  end

  def self.down
    remove_column :membres, :email
  end
end
