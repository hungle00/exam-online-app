class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :submissions

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
end
