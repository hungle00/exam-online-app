class Admin::ExportCsvController < ApplicationController
  def users
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end
  
  
  def reports
    @reports = Report.all
    respond_to do |format|
      format.html
      format.csv { send_data @reports.to_csv, filename: "reports-#{Date.today}.csv" }
    end
  end
end
