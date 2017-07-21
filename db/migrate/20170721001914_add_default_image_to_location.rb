class AddDefaultImageToLocation < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :image, :string, default: "https://www.calidad.com.au/images/no-image.jpg"
  end
end
