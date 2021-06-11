class MessagesController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      Notification.create(notification_params)
      redirect_to room_path(@room, partner_id: params[:message][:partner_id])
    else
      @messages = @room.messages.includes(:user)
      render room_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end

  def notification_params
    params.permit.merge(user_id: params[:message][:partner_id].to_i, visiter: current_user.id, message_id: @message.id)
  end
end
