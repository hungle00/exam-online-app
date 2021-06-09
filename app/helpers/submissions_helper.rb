module SubmissionsHelper
  def render_answers(answers)
    #answers.present? && answers.size <= 1 ? answers.first : answers
    answers.join(', ') if answers.present?
  end
end
