class AddTipIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :tip_id, :integer
  end
end
