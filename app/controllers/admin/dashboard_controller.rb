class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  layout "admin"

  def users
    @users = User.order(:created_at)
  end

  def stats
    @exams = Exam.order(:created_at)
  end

  def reports
    @reports = Report.order(:created_at).includes(:user, :question)
  end
end
