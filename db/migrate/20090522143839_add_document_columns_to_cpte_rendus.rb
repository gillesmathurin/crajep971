class AddDocumentColumnsToCpteRendus < ActiveRecord::Migration
  def self.up
    add_column :cpte_rendus, :document_file_name, :string
    add_column :cpte_rendus, :document_content_type, :string
    add_column :cpte_rendus, :document_file_size, :integer
    add_column :cpte_rendus, :document_updated_at, :datetime
  end

  def self.down
    remove_column :cpte_rendus, :document_updated_at
    remove_column :cpte_rendus, :document_file_size
    remove_column :cpte_rendus, :document_content_type
    remove_column :cpte_rendus, :document_file_name
  end
end
