class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :content
      t.boolean :is_correct, default: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
