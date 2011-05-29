class AddNotifType < ActiveRecord::Migration
  def self.up
    add_column :notifications, :type, :string
  end

  def self.down
  end
end
