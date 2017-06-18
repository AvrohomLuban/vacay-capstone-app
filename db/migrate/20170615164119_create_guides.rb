class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :price

      t.timestamps
    end
  end
end
