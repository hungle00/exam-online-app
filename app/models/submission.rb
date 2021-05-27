class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :exam

  has_many :question_submissions, dependent: :destroy
  accepts_nested_attributes_for :question_submissions, reject_if: proc { |att| att['options'].blank? }
  
  def answers
    answers = {}
    question_submissions.each do |qs|
      answers[qs.question_id] = qs.options
    end
    answers
  end
end
