class ChangeOptionToBeOptions < ActiveRecord::Migration[6.1]
  def change
    rename_column :question_submissions, :option, :options
    change_column :question_submissions, :options, :text
  end
end
