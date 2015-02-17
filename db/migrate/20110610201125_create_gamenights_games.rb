class CreateGamenightsGames < ActiveRecord::Migration
  def self.up
    create_table :gamenights_games, :id => false do |t|
      t.references :game, :gamenight
    end

    Gamenight.all.each do |gamenight|
      gamenight.game_ids = [ gamenight.game_id ]
      gamenight.save!
    end

    remove_column :gamenights, :game_id
  end

  def self.down
    add_column :gamenights, :game_id, :integer

    Gamenight.all.each do |gamenight|
      gamenight.game_id = gamenight.game_ids.first
      gamenight.save!
    end

    drop_table :gamenights_games
  end

end
