class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @partner = User.find(params[:partner_id])
    if @room = Room.create(room_params)
      redirect_to room_path(@room.id, partner_id: params[:partner_id][0])
    else
      render user_path
    end
  end

  def show
    @partner = User.find(params[:partner_id])
    @user = User.find(current_user.id)
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
end
