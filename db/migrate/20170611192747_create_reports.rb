class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :season
      t.string :duration
      t.string :text
      t.boolean :posted_live
      t.string :title_font
      t.string :destination_font
      t.string :season_font
      t.string :duration_font
      t.string :text_font
      t.string :title_size
      t.string :destination_size
      t.string :season_size
      t.string :text_size
      t.string :duration_size
      t.string :user_id

      t.timestamps
    end
  end
end
