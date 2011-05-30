class NotificationsController < ApplicationController
  require 'rubygems'
  require 'action_view'
  include ActionView::Helpers::DateHelper

  def index
    @notifications = GamenightInvitationNotification.all +
        FriendInvitationNotification.all +
        FriendshipEndingNotification.all +
        FriendshipAcceptationNotification.all
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to(notifications_url) }
      format.xml  { head :ok }
    end  end

end
