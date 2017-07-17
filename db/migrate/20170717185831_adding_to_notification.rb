class AddingToNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :tip_id, :integer
    add_column :notifications, :report_id, :integer
    add_column :notifications, :question_id, :integer
  end
end
