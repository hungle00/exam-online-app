class Admin::ExamsController < ApplicationController
  before_action :set_exam, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  before_action :require_admin

  # GET /exams/new
  def new
    @exam = Exam.new
    render layout: "intro"
  end

  # GET /exams/1/edit
  def edit
    render layout: "intro"
  end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to @exam, notice: "Exam was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    if @exam.update(exam_params)
      redirect_to @exam, notice: "Exam was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy
    redirect_to exams_url, notice: "Exam was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(
        :title, :time, :category_id,
        questions_attributes: [
          :id, :title, :score, :_destroy,
          options_attributes: [:id, :content, :is_correct, :_destroy]
        ])
      #params.require(:exam).permit(:title, :time, :category_id)
    end
end