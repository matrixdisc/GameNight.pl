class CreateUsersGames < ActiveRecord::Migration
  def self.up
    create_table :games_users, :id => false do |t|
      t.references :user, :game
    end    
  end

  def self.down
    drop_table :games_users
  end
end
