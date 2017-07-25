class AddScoreToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :score, :integer
  end
end
