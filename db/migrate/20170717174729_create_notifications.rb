class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :answer_id
      t.boolean :read

      t.timestamps
    end
  end
end
