class SomeChangesToTipModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :tips, :report_id, :integer
    add_column :tips, :category, :string
    add_column :tips, :location_id, :integer
  end
end
