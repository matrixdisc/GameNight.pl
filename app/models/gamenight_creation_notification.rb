class GamenightCreationNotification < Notification
  def message(current_user)
    (user.eql?(current_user)  ? "You" : user.username)+" created a new gamenight."
  end
end
