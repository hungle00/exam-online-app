class AddTimeToExamAndSubmission < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :time, :integer
    add_column :submissions, :response_time, :integer
  end
end
