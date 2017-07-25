class DefaultTipScoretoZero < ActiveRecord::Migration[5.0]
  def change
    change_column :tips, :score, :integer, default:0
  end
end
