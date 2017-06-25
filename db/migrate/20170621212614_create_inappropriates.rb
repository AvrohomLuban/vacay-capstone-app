class CreateInappropriates < ActiveRecord::Migration[5.0]
  def change
    create_table :inappropriates do |t|
      t.integer :report_id
      t.integer :tip_id
      t.integer :comment_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
