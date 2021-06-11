class RelationshipsController < ApplicationController
  def create
    @relationship = Relationship.new(user_set)
    if @relationship.save!
      Notification.create!(notice_params)
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user_path(params[:follow_id])
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to users_path
    end
  end

  def destroy
    @relationship_search = Relationship.find((Relationship.where(user_id: current_user.id).pluck(:id) & Relationship.where(follow_id: params[:follow_id]).pluck(:id))[0])
    if @relationship_search.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user_path(params[:follow_id])
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to users_path
    end
  end

  private

  def user_set
    params.permit(:follow_id).merge(user_id: current_user.id)
  end

  def notice_params
    params.permit.merge(user_id: params[:follow_id], visiter: current_user.id, relationship_id: @relationship.id)
  end
end
