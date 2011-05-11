class AddProfileFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
  end

  def self.down
    remove_column :users, :location
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
