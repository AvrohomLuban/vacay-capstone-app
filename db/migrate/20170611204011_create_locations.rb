class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :image

      t.timestamps
    end
  end
end
