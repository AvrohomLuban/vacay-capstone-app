class ChangeReportTextFromStringToText < ActiveRecord::Migration[5.0]
  def change
    change_column :reports, :text, :text
  end
end
