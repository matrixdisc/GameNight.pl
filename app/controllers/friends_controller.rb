class FriendsController < ApplicationController
  # GET /friends/1
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def send_invite
    @user = User.find(params[:id])
    @count = Invite.count(:conditions => ["user_id = ? and user_id_target = ?", current_user.id, @user.id])
    if @count.eql?(0)

      Invite.create(:user => current_user, :user_target => @user, :message => "I wanna be your friend")
      redirect_to(:back, :notice => "Invitation sent.")
    else
      redirect_to(:back, :notice => "Invitation already sent.")
    end
  end

  def index
    @user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
end
