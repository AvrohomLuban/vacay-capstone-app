class AddDefaultScoretoReports < ActiveRecord::Migration[5.0]
  def change
    change_column :reports, :score, :integer, default: 0
  end
end
