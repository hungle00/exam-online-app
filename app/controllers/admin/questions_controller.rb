class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_exam
  before_action :set_question, only: [:edit, :update, :destroy]

  def create
    @question = @exam.questions.build(question_params)

    if @question.save
      redirect_to exam_path(@exam), notice: 'Question was successfully created.'
    else
      redirect_to exam_path(@exam)
    end
  end

  def update
    if @question.update(question_params)
      redirect_to exam_path(@exam), notice: 'Question was successfully updeated.'
    else
      redirect_to exam_path(@exam)
    end
  end

  def destroy
    @question.destroy
    redirect_to exam_path(@exam), notice: 'Question was successfully destroyed.'
  end

  private

    def set_exam
      @exam = Exam.find(params[:exam_id])
    end

    def set_question
      @question = @exam.questions.find(params[:id])
      #@question = Exam.find(params[:id])
    end

    def question_params
      params.require(:question).permit(
        :title, :score, :exam_id,
        options_attributes: [:id, :content, :is_correct, :_destroy])
    end
end
