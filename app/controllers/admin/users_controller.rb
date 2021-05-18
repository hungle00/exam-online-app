class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @users = User.order(:created_at)
  end
end
