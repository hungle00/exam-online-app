class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :submissions

  def total_score
    self.questions.sum(:score)
  end
end
