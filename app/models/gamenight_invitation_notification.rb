class GamenightInvitationNotification < Notification
  def message(current_user)
    return recipient.username+" invites you to join his gamenight "
  end
end