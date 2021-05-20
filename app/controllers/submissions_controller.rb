class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @submission = Submission.new(submission_params)
    @submission.score = 20 # just fake
    if @submission.save!
      redirect_to exams_path, notice: "Submit successfully."
    else
      redirect_to @submission.exam, notice: "You are fucking idiot"
    end
  end

  def submission_params
		params.require(:submission).permit(:user_id, :exam_id)
	end
end
