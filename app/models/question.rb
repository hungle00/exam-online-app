class Question < ApplicationRecord
  belongs_to :exam
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: {minimum: 3, maximum: 60}
  validates :score, numericality: { greater_than: 9, less_than: 16, only_integer: true }

  def answer
    options.select { |option| option.is_correct? } 
  end
end
