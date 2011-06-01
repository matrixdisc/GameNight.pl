class DashboardController < ApplicationController
  def index
    @user = current_user
    @gamenights = current_user.gamenights + Gamenight.find_all_by_host_id(current_user.id)
    @notifications = Notification.order("created_at desc").find_all_by_recipient_id(current_user.id)
  end

end
