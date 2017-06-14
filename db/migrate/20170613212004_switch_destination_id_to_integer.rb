class SwitchDestinationIdToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :destinations, :location_id, :integer, using: 'location_id::integer'
    change_column :destinations, :report_id, :integer, using: 'report_id::integer'
  end
end
