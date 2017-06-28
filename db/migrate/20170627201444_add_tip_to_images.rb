class AddTipToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :tip_id, :integer
  end
end
