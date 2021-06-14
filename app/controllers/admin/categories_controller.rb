class Admin::CategoriesController < ApplicationController
    before_action :set_category, only: %i[ update destroy ]
    before_action :authenticate_user!
    before_action :require_admin

    def index
      @categories = Category.includes(:exams)
      @category = Category.new

      render layout: "admin"
    end
  
    # POST /categories or /categories.json
    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to @category, notice: "Category was successfully created."
      else
        redirect_back fallback_location: categories_url, notice: "Category must not blank!" 
      end
    end
  
    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      if @category.update(category_params)
        redirect_to @category, notice: "Category was successfully updated."
      else
        redirect_back fallback_location: @category, notice: "Category must not blank!" 
      end
    end
  
    # DELETE /categories/1 or /categories/1.json
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.friendly.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:name)
      end
end