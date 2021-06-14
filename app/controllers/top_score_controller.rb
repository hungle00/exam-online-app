class TopScoreController < ApplicationController
  before_action :authenticate_user!

  def index
    @submissions = Submission.all.select { |submission| submission.grade == "Excellent" }
  end
end