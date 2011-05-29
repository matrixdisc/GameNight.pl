class GamenightInvitationNotification < Notification
  def message(current_user)
    return "#{user.username} invites you to join his gamenight "
  end
end