class ExamsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /exams or /exams.json
  def index
    @exams = Exam.all
    @exam = Exam.new
  end

  # GET /exams/1 or /exams/1.json
  def show
    @exam = Exam.find(params[:id])
    @question = Question.new
  end

  def take
    @exam = Exam.find(params[:id])
    @questions = @exam.questions.includes(:options)

    @submission = Submission.new
  end
end
