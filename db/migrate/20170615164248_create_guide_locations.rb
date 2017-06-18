class CreateGuideLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :guide_locations do |t|
      t.integer :guide_id
      t.integer :location_id
      t.string :text

      t.timestamps
    end
  end
end
