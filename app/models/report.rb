class Report < ApplicationRecord
  belongs_to :user
  belongs_to :question

  CONTENTS = [
    "Question have no answer",
    "I don't understand question",
    "This exam have same question"
  ]

  def self.to_csv
    attributes = %w{question_id user_id content created_at}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |report|
        csv << attributes.map{ |attr| report.send(attr) }
      end
    end
  end
end
