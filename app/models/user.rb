class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  before_save :validate_username
  has_one_attached :avatar

  has_many :notifications
  has_many :submissions

  def count_submissions
    self.submissions.count
  end

  private 
  
    def validate_username
      errors.add(:username, :invalid) if User.where(username: username).exists?
    end
end
