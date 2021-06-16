class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :question_submissions, dependent: :destroy
  accepts_nested_attributes_for :question_submissions, reject_if: proc { |att| att['options'].blank? }
  
  after_save :send_notifications_to_users, if: :top_score?


  def self.order_by_range
    all.group_by(&:grade).transform_values(&:count)
  end

  def answers
    answers = {}
    question_submissions.each do |qs|
      answers[qs.question_id] = qs.options
    end
    answers
  end

  def grade
    percent = (score.to_f / exam.total_score).round(2) * 100
    case percent
    when 0..30
      "Bad"
    when 30..60
      "Medium"
    when 60..80
      "Quite good"
    when 80..100
      "Excellent"
    end
  end

  def top_score?
    grade == "Excellent"
  end

  private

    def send_notifications_to_users
      User.all.each do |user|
        Notification.create!(content: "New top user in exam: #{exam.title}", user: user)
      end
    end
end
