class ChangePhotoTitleToSubtitle < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :title, :string
    add_column :photos, :subtitle, :string
  end
end
