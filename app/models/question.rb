class Question < ApplicationRecord
  belongs_to :exam
  has_many :options, dependent: :destroy
  has_many :reports, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: {minimum: 3, maximum: 80}
  validates :score, numericality: { greater_than: 0, only_integer: true }

  def answers
    options.select { |option| option.is_correct? } 
  end

  def multiple_choice_question?
    answers.size > 1
  end
end
