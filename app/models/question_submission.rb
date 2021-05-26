class QuestionSubmission < ApplicationRecord
  serialize :options, Array

  belongs_to :question
  belongs_to :submission

  def options=(options)
    options = options.split if options.is_a?(String)
    super(options)
  end
end
