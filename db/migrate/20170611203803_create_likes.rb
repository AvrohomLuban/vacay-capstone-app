class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.string :user_id
      t.integer :tip_id, optional: true
      t.integer :report_id, optional: true
      t.boolean :like

      t.timestamps
    end
  end
end
