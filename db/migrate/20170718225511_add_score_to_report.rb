class AddScoreToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :score, :integer, dafault: 0
  end
end
