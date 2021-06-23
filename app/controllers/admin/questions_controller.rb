class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_question


  def destroy
    @question.destroy
    redirect_to exam_path(@exam), notice: 'Question was successfully destroyed.'
  end

  private

    def set_question
      @exam = Exam.find(params[:exam_id])
      @question = @exam.questions.find(params[:id])
    end
end
