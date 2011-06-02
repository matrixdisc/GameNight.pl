class FriendsController < ApplicationController
  def send_invite
    @user = User.find(params[:id])
    @count = Invite.count(:conditions => ["user_id = ? and user_id_target = ?", current_user.id, @user.id])
    if @count.eql?(0)

      invite = Invite.create(:user => current_user, :user_target => @user, :message => "I wanna be your friend", :is_accepted => false)

      FriendInvitationNotification.create(:user => current_user, :recipient =>@user, :target => current_user )

      flash[:mood] = "positive"
      redirect_to(:back, :notice => "Invitation sent.")
    else
      flash[:mood] = "neutral"
      redirect_to(:back, :notice => "Invitation already sent.", :mood =>"neutral")
    end
  end

  def end_friendship
    user = User.find(params[:id])
    myinv = Invite.find(:all).select{|i|i.user_id = current_user}.select{|i|i.user_id_target = user.id}
    targetinv = Invite.find(:all).select{|i|i.user_id = user.id}.select{|i|i.user_id_target = current_user}
    Invite.delete(myinv)
    Invite.delete(targetinv)
    user.reload and current_user.reload
    FriendshipEndingNotification.create(:user => current_user, :recipient => user, :target => current_user )
    flash[:mood] = "neutral"
    redirect_to(user, :notice => "Friendship ended succesfully.")
  end

  def index
    @user = current_user
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end
end
