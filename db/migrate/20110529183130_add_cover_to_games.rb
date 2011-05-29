class AddCoverToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :cover, :string
  end

  def self.down
    remove_column :games, :cover
  end
end
