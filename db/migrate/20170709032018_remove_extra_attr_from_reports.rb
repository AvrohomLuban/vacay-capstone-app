class RemoveExtraAttrFromReports < ActiveRecord::Migration[5.0]
  def change
    remove_column :reports, :title_font, :string
    remove_column :reports, :destination_font, :string
    remove_column :reports, :season_font, :string
    remove_column :reports, :duration_font, :string
    remove_column :reports, :text_font, :string
    remove_column :reports, :title_size, :string
    remove_column :reports, :destination_size, :string
    remove_column :reports, :season_size, :string
    remove_column :reports, :text_size, :string
    remove_column :reports, :duration_size, :string
    remove_column :reports, :city2, :string
    remove_column :reports, :state2, :string
    remove_column :reports, :country2, :string
    remove_column :reports, :city3, :string
    remove_column :reports, :state3, :string
    remove_column :reports, :country3, :string
    remove_column :reports, :city4, :string
    remove_column :reports, :state4, :string
    remove_column :reports, :country4, :string
    remove_column :reports, :city5, :string
    remove_column :reports, :state5, :string
    remove_column :reports, :country5, :string
  end
end
