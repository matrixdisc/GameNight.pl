class FriendshipEndNotification < Notification
  def message(current_user)
    (user.eql?(current_user) ? "You" : user.username)+" ended friendship with "+(recipient.eql?(current_user) ? "you." : recipient.username+".")
  end
end
