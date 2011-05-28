class NotificationsController < ApplicationController
  require 'rubygems'
  require 'action_view'
  include ActionView::Helpers::DateHelper

  def show
  end

  def index
    @notifications = GamenightInvitationNotification.all +
        FriendInvitationNotification.all +
        FriendshipEndNotification.all +
        FriendshipAcceptNotification.all
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to(notifications_url) }
      format.xml  { head :ok }
    end  end

end
