class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :report_id
      t.string :subtitle

      t.timestamps
    end
  end
end
