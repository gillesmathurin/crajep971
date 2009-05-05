class CreateCpteRendus < ActiveRecord::Migration
  def self.up
    create_table :cpte_rendus do |t|
      t.string :titre
      t.datetime :published_at
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cpte_rendus
  end
end
