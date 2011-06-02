class GamenightCreationNotification < Notification
  def message(current_user)
    (user.eql?(current_user)  ? "You" : user.username)+" created a new gamenight"+(target.nil? ? ", but it was since deleted." :".")
  end
  def target_link_name
    "Gamenight #{(not(target.nil?)) ? target.name: ""}"
  end
end
