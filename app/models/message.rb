class Message < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :room
  has_many :notifications
end
