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

class FriendshipEndingNotification < Notification
  def message(current_user)
    (user.eql?(current_user) ? "You" : user.username)+" ended friendship with "+(recipient.eql?(current_user) ? "you." : recipient.username+".")
  end
end
