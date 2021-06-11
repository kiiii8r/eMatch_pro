class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :role
  has_one_attached :image

  has_one :user

  validates :user_id, presence: true, uniqueness: true
end
