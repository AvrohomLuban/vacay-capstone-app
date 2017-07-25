class DefaultImageTolocation < ActiveRecord::Migration[5.0]

    def change
    change_column :locations, :image, :string, default: "http://www.survivetravel.com/wp-content/uploads/2015/11/World-Travel-Wallpaper-3.jpg"
  end
end
