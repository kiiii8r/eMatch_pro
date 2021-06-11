class Notification < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :relationship, optional: true
  belongs_to :message, optional: true
end
