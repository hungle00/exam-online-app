class QuestionSubmission < ApplicationRecord
  serialize :options, Array

  belongs_to :question
  belongs_to :submission

  before_validation do
    self.options = options.select { |option| option != "0" }
  end

  def options=(options)
    options = options.split if options.is_a?(String)
    super(options)
  end


end
