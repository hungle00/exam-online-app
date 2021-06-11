class PagesController < ApplicationController
  layout "intro"

  def home
    redirect_to exams_path if current_user
  end
end
