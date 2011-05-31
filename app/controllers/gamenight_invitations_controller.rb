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
    @invitation = User.find(params[:friend_id]).gamenight_invitations.create :gamenight_id => params[:gamenight_id], :user_inviting_id => current_user.id
    GamenightInvitationNotification.create(:user => current_user, :recipient => User.find(params[:friend_id]), :target => @invitation)
    if @invitation.save
      redirect_to :action => "invite_friends", :gamenight_id => params[:gamenight_id]
    else
      redirect_to :friends
    end
  end

  def show
    @invitation = current_user.gamenight_invitations.find_by_id params[:id]
    respond_to do |format|
      format.html
    end
  end

  def accept
    @invitation = current_user.gamenight_invitations.find_by_id params[:id]
    @invitation.update_attributes :is_accepted => true
    redirect_to :controller => :gamenights, :action => :show, :id => @invitation.gamenight_id
  end
end