class PagesController < ApplicationController
  def home
    redirect_to exams_path if current_user
  end
end
