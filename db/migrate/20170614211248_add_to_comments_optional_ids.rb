class AddToCommentsOptionalIds < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :tip_id, :integer
    remove_column :comments, :report_id, :integer
  end
end
