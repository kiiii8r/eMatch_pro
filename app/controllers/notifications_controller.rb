class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user_id: current_user.id).order(created_at: :desc)
  end

  def destroy
    @notifications = Notification.where(user_id: current_user.id)
    if @notifications.destroy_all
      redirect_to users_path
    else
      redirect :index
    end
  end

  private

  def visiter_user
    @visiter = User.find(@notifications.visiter)
  end
end
