class CreateTips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :text
      t.integer :user_id, optional: true
      t.integer :report_id, optional: true
      t.string :venue

      t.timestamps
    end
  end
end
