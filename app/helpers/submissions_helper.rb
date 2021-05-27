module SubmissionsHelper
  def render_answers(answers)
    answers.present? && answers.size <= 1 ? answers.first : answers
  end
end
