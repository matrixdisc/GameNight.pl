class NotificationsController < ApplicationController
  def show
  end

  def index
    @notifications = Notification.all
  end

  def delete
  end

end
