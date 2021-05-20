class Question < ApplicationRecord
  belongs_to :exam
  has_many :options

  validates :title, presence: true, uniqueness: true
end
