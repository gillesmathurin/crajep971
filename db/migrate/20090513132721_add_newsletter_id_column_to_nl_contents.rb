class AddNewsletterIdColumnToNlContents < ActiveRecord::Migration
  def self.up
    add_column :nl_contents, :newsletter_id, :integer
  end

  def self.down
    remove_column :nl_contents, :newsletter_id
  end
end
