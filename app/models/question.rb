class Question < ApplicationRecord
  belongs_to :exam
  has_many :options

  validates :title, presence: true, length: {minimum: 3, maximum: 60}
	validates :score, presence: true
end
