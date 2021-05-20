class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_exam
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @question = @exam.questions.build
  end

  def edit
  
  end


  def create
    @question = @exam.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to exam_path(@exam), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to exam_question_path(@question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to exam_path(@exam), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:question).permit(:title, :score, :exam_id)
    end
end
