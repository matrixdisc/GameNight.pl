class NotificationsController < ApplicationController
  require 'rubygems'
  require 'action_view'
  include ActionView::Helpers::DateHelper

  def index
    @notifications = Notification.find_all_by_recipient_id(current_user.id).sort{|a,b| a.updated_at<=>b.updated_at}.reverse
    respond_to do |format|
      format.html
    end
    @notifications.each do |n|
      n.unread = false
      n.save!
    end

  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to(notifications_url) }
      format.xml  { head :ok }
    end  end

end
