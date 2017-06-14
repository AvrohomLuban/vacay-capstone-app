class AddTipAndReportToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :tip_id, :integer, optional: true
    add_column :comments, :report_id, :integer, optional: true
  end
end
