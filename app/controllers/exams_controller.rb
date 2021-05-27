class ExamsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /exams or /exams.json
  def index
    @exams = Exam.includes(:category)
    @exam = Exam.new

    @exams = @exams.search(params[:search])

    if params[:order] && params[:order] == "Sort by title"
      @exams = @exams.sort_by_title
    elsif params[:order] && params[:order] == "Sort by score"
      @exams = @exams.sort_by_score.reverse
    else
      @exams = @exams
    end
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
