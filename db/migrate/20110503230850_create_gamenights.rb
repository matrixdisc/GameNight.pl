class CreateGamenights < ActiveRecord::Migration
  def self.up
    create_table :gamenights do |t|
      t.integer :host_id, :null => false
      t.string :name
      t.string :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :players_slots

      t.timestamps
    end
    add_index :gamenights, :host_id
  end

  def self.down
    drop_table :gamenights
  end
end
