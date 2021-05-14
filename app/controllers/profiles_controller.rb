class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @submissions = @user.submissions
  end
end
