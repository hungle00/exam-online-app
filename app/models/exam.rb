class Exam < ApplicationRecord
  belongs_to :category, dependent: :destroy
  has_many :questions
  has_many :submissions

  def total_score
    questions.sum(:score)
  end
end
