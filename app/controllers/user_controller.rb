class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @submissions = Submission.all.select { |submission| submission.grade == "Excellent" }
  end
  
  def show
    @user = User.friendly.find(params[:id])
    @submissions = @user.submissions
  end
end