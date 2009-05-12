class AddMailAndYearColumnToCandidatures < ActiveRecord::Migration
  def self.up
    add_column :candidatures, :mail_contact, :string
    add_column :candidatures, :annee_creation, :string
  end

  def self.down
    remove_column :candidatures, :annee_creation
    remove_column :candidatures, :mail_contact
  end
end
