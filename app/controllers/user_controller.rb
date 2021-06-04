class UserController < ApplicationController
  before_action :authenticate_user!

  def index
  
  end
  
  def show
    @user = User.friendly.find(params[:id])
    @submissions = @user.submissions
  end
end