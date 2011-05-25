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
    @notification = Notification.make_notification(current_user, User.find(params[:friend_id]), @invitation, @invitation.notification_class)
    if @invitation.save & @notification.save!
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