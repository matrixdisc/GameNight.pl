class AddIsRepliedToGamenightInvitations < ActiveRecord::Migration
  def self.up
    add_column :gamenight_invitations, :is_replied, :boolean
  end

  def self.down
    remove_column :gamenight_invitations, :is_replied
  end
end