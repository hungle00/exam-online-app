class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  before_create :validate_username
  has_one_attached :avatar

  has_many :notifications, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :reports, dependent: :destroy

  def count_submissions
    submissions.count
  end

  private 
  
    def validate_username
      errors.add(:username, :invalid) if User.where(username: username).exists?
    end
end
