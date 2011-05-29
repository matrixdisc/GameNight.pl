class InvitesController < ApplicationController
  def index
    @invites_in = current_user.invites_in.select{|i|i.is_accepted!=true}
  end

  def accept
    invite = Invite.find(params[:id])
    @user = invite.user_target
    invite.accepted_at=Time.now
    invite.is_accepted=true
    invite.save
    name = "unknown"
    if invite.user_target.eql?(current_user)
       name = invite.user.first_name
    else
       name = invite.user_target.first_name
    end
    notification = Notification.create(current_user, invite.user_target, current_user, FriendshipAcceptationNotification)
    notification.save!
    redirect_to(:friends, :notice => "#{name} is now your friend!", :mood => :positive)
  end

  def destroy
    invite = Invite.find(params[:id])
    invite.destroy
    redirect_to(invites_path)
  end
end
