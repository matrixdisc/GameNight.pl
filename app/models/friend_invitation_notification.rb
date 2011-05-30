class FriendInvitationNotification < Notification
  def message(current_user)
    user.username+" wants to be your friend!"
  end
end
