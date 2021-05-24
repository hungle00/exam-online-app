class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :submissions

  def total_score
    questions.sum(:score)
  end
end
