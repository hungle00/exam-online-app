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

  scope :online, ->{ where("last_seen_at > ?", 5.minutes.ago) }

  def self.omniauth(auth)
    username = auth.info.nickname
    user = find_or_create_by!(username: username) do |u|
      u.username = username
      u.password = Devise.friendly_token[0, 20]
      u.oauth_token = auth.credentials.token
      u.provider = auth.provider
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

  def self.to_csv
    attributes = %w{username email provider created_at updated_at}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  private 
  
    def validate_username
      errors.add(:username, :invalid) if User.where(username: username).exists?
    end
end
