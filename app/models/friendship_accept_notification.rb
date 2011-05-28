class FriendshipAcceptNotification < Notification
  def message(current_user)
    user.username+" accepted your friendship invitation."
  end
end