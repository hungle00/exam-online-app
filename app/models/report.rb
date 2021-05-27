class Report < ApplicationRecord
  belongs_to :user
  belongs_to :question

  CONTENTS = [
    "Question have no answer",
    "I don't understand question",
    "This exam have same question"
  ]
end
