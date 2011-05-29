class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.string :target_type
      t.integer :target_id
      t.integer :recipient_id
      t.string  :notifications, :null => :false
      t.boolean :unread, :default => true
      t.timestamps
    end
    add_index :notifications, [:target_type, :target_id]
  end

  def self.down
    remove_table :notifications
  end
end
