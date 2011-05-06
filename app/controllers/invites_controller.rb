class InvitesController < ApplicationController
  def index
  end

  def show
    @invites = Invite.find(:all).select{|i|i.user_id = current_user}.select{|i|i.is_accepted!=true}
  end

  def accept
    invite = Invite.find(params[:id])
    invite.accepted_at=Time.now
    invite.is_accepted=true
    invite.save
  end

  def destroy
    Invite.find(params[:id]).destroy
    redirect_to('friendreqs')
  end
end
