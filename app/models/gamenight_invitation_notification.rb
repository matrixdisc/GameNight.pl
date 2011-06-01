# == Schema Information
# Schema version: 20110529183130
#
# Table name: notifications
#
#  id            :integer         not null, primary key
#  target_type   :string(255)
#  target_id     :integer
#  recipient_id  :integer
#  notifications :string(255)
#  unread        :boolean         default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  type          :string(255)
#

class GamenightInvitationNotification < Notification
  def message(current_user)
    return "#{user.username} invites you to join his gamenight"+(target.gamenight.nil? ? ", but it was since deleted." : ".")
  end
  def target_link_name
    target.gamenight.nil? ? "" : "Gamenight #{target.gamenight.name}"
  end
end
