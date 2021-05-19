class ExamsController < ApplicationController
  #before_action :set_exam, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  #before_action :require_admin, except: [:index, :show]

  # GET /exams or /exams.json
  def index
    @exams = Exam.all
  end

  # GET /exams/1 or /exams/1.json
  def show
    @exam = Exam.find(params[:id])
    @questions = @exam.questions
  end
end
