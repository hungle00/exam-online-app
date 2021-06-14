class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_destroy :ensure_not_referenced_by_an_exam
  has_many :exams, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  def submissions
    exams.sum { |exam| exam.submissions.count }
  end

  private
    #ensure that there are no exams referencing this category
    def ensure_not_referenced_by_an_exam
      unless exams.empty?
        errors.add(:base, 'Exams present')
        throw :abort
      end
    end
end
