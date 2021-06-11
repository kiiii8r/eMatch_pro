module NotificationsHelper
  def visiter_user(notification)
    @visiter = User.find(notification.visiter)
  end

  def notification_form(notification, visiter)
    if notification.relationship_id.present?
      tag.h3(visiter.nickname + 'さん') + 'がフォローしました'
    elsif notification.message.present?
      @room_number = RoomUser.where(user_id: current_user.id).pluck(:room_id) & RoomUser.where(user_id: visiter.id).pluck(:room_id)
      tag.a(visiter.nickname + 'さん', href: room_path(@room_number, params: { partner_id: visiter.id })) + 'よりメッセージです'
    end
  end

  def notice_count
    @notice_count = Notification.where(user_id: current_user.id).count
  end
end
