class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :tip_id, optional: true
      t.string :report_id, optional: true
      t.string :location_id

      t.timestamps
    end
  end
end
