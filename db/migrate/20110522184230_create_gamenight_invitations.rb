class CreateGamenightInvitations < ActiveRecord::Migration
  def self.up
    create_table :gamenight_invitations do |t|
      t.column :user_id, :integer, :null => false
      t.column :user_inviting_id, :integer, :null => false
      t.column :gamenight_id, :integer, :null => false
      t.column :code, :string
      t.column :message, :text
      t.column :is_replied, :boolean
      t.column :is_accepted, :boolean
      t.column :accepted_at, :timestamp
    end
  end

  def self.down
    drop_table :gamenight_invitations
  end
end