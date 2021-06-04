class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github twitter]

  extend FriendlyId
  friendly_id :username, use: :slugged
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  before_create :validate_username
  has_one_attached :avatar

  has_many :notifications, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :reports, dependent: :destroy

  def self.omniauth(auth)
    username = auth.info.nickname
    user = find_or_create_by!(username: username) do |u|
      u.username = username
      u.password = Devise.friendly_token[0, 20]
      u.oauth_token = auth.credentials.token
      u.email = "#{username}@email.com" #fake
    end
    return unless user

    if user.oauth_token != auth.credentials.token
      user.update_attribute(:oauth_token, auth.credentials.token)
    end
    user
  end

  def count_submissions
    submissions.count
  end

  private 
  
    def validate_username
      errors.add(:username, :invalid) if User.where(username: username).exists?
    end
end
