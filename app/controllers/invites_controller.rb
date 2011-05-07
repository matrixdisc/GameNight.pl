class InvitesController < ApplicationController
  def index
    @invites_in = current_user.invites_in.select{|i|i.is_accepted!=true}
  end

  def accept
    invite = Invite.find(params[:id])
    invite.accepted_at=Time.now
    invite.is_accepted=true
    invite.save
    redirect_to(:friends)
  end

  def destroy
    invite = Invite.find(params[:id])
    invite.destroy
    redirect_to(invites_path)
  end
end
