class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :location_id
      t.integer :user_id
      t.string :question

      t.timestamps
    end
  end
end
