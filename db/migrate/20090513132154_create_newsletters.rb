class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.datetime :published_at
      t.string :titre

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
