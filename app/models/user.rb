class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :role

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]

  has_one :profile
  has_many :room_users
  has_many :messages
  has_many :rooms, through: :room_users
  has_many :notifications
  has_many :sns_credentials

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def following?(other_user)
    followings.include?(other_user)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  validates :nickname, presence: true, length: { maximum: 8 }

  with_options presence: true do
    validates :birth_day
    validates :gender
    validates :age
  end

  validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'Include both letters and numbers' }, allow_nil: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end

