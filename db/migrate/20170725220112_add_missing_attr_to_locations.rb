class AddMissingAttrToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :missing, :boolean
  end
end
