class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: [:destroy]

  def create
    @report = current_user.reports.new(report_params)
    if @report.save!
      redirect_back(fallback_location: "/", notice: 'Thank you for report ^_^')
      #redirect_to submission_path(@report.question.submission), 
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to dashboard_reports_path, notice: "Report was successfully destroyed."
  end

  private

    def set_submission
      @submission = Submission.find(params[:submission_id])
    end

    def report_params
      params.require(:report).permit(:user_id, :question_id, :content)
    end
end
