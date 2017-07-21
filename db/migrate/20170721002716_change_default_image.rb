class ChangeDefaultImage < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :image, :string, default: "https://s-media-cache-ak0.pinimg.com/736x/a5/2c/bb/a52cbb1b7c19e716e798fe2c0827d6f6--quotes-of-inspiration-travel-inspiration.jpg"
  end
end
