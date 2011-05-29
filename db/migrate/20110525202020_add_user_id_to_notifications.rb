class AddUserIdToNotifications   < ActiveRecord::Migration
  def self.up
    add_column :notifications, :user_id, :integer
  end

  def self.down
  end
end
