class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :submissions, dependent: :destroy

  # set default 60 second if null, then convert minute to second
  before_save do 
    time.nil? ? self.time = 60 : self.time = time * 60 
  end

  after_create :send_notifications_to_users

  scope :sort_by_title, -> { order(title: :asc) }
  scope :sort_by_score, -> { all.sort_by(&:total_score) }

  def total_score
    questions.sum(:score)
  end

  def self.search(term)
    if term.present?
      where("title LIKE ?", "%#{term}%")
    else
      all
    end
  end

  def top_score
    submissions.order('score DESC').limit(3)
  end

  private
    def send_notifications_to_users
      User.all.each do |user|
        Notification.create!(content: "New exam is created", user: user)
      end
    end

end
