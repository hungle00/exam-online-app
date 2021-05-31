class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @submission = Submission.find(params[:id])
    @answers = @submission.answers
    @report = Report.new
  end
  
  def create
    @submission = current_user.submissions.new(submission_params)
    if @submission.save!
      total_score = 0
      question_submissions = QuestionSubmission.where(submission_id: @submission.id) 
      question_submissions.each do |qs|
        qs.question.options.each do |option|
          logger.debug "Option is #{option.content} - #{option.is_correct}"
          if option.is_correct && option.content == qs.options.first
            total_score += qs.question.score
          end
        end
      end
      @submission.score = total_score
      @submission.save!
      redirect_to @submission, notice: "Submit successfully."
    else
      redirect_to @submission.exam, notice: "You are fucking idiot"
    end
  end

  private

    def submission_params
      params.require(:submission).permit(
        :user_id, :exam_id, :response_time,
        question_submissions_attributes: [:question_id, :options])
    end
end
