class GamenightInvitationsController < ApplicationController
  def index
    @gamenight_invitations = current_user.gamenight_invitations
  end

  def invite_friends
    @user = current_user
    @gamenight = Gamenight.find(params[:gamenight_id])
    respond_to do |format|
      format.html
    end
  end

  def invite
    @invitation = User.find(params[:friend_id]).gamenight_invitations.create :gamenight_id => params[:gamenight_id]
    if @invitation.save
      redirect_to :action => "invite_friends", :gamenight_id => params[:gamenight_id]
    else
      redirect_to :friends
    end
  end
end