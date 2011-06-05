class CreateUserSettings < ActiveRecord::Migration
  def self.up
    create_table :user_settings do |t|
      t.integer :user_id
      t.boolean :has_twitter
      t.boolean :send_tweet_on_gn_creation
      t.boolean :email_on_pokes
      t.boolean :email_on_invitations
    end
    add_column :users, :user_settings_id, :integer
  end

  def self.down
    drop_table :user_settings
  end
end
