class RemoveTipIdFromDestinations < ActiveRecord::Migration[5.0]
  def change
    remove_column :destinations, :tip_id, :integer
  end
end
