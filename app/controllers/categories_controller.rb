class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.friendly.find(params[:id])
    @exams = @category.exams
  end
end
