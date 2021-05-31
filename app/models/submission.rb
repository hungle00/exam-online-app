class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :question_submissions, dependent: :destroy
  accepts_nested_attributes_for :question_submissions, reject_if: proc { |att| att['options'].blank? }
  
  after_create :send_notifications_to_users, if: :top_score?

  def answers
    answers = {}
    question_submissions.each do |qs|
      answers[qs.question_id] = qs.options
    end
    answers
  end

  private

    def top_score?
      exam.top_score.include?(self)
    end

    def send_notifications_to_users
      User.all.each do |user|
        Notification.create!(content: "New top user in exam: #{exam.title}", user: user)
        ActionCable.server.broadcast "notifications.#{ user.id }", { message: "new notification" }
      end
    end
end
