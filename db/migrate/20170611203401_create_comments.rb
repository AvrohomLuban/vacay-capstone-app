class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :report_id, optional: true
      t.string :user_id 
      t.string :tip_id, optional: true

      t.timestamps
    end
  end
end
