class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /categories or /categories.json

  # GET /categories/1 or /categories/1.json
  def show
    @categories = Category.all
    @category = Category.friendly.find(params[:id])
    @exams = @category.exams
    @exam = Exam.new
  end
end
