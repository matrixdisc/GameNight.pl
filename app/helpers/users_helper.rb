module UsersHelper
    def send_invitation
    invite = Invite.create(:user => current_user, :user_target => @user, :message => "I wanna be your friend")
    invite.save
    #format.html { redirect_to(:friends, :notice => "Invitation sent.") }
  end
end
