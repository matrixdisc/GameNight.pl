class AddGameIdToGamenight < ActiveRecord::Migration
  def self.up
    add_column :gamenights, :game_id, :integer
  end

  def self.down
    remove_column :gamenights, :game_id
  end
end
