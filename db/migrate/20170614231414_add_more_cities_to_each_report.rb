class AddMoreCitiesToEachReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :city2, :string
    add_column :reports, :state2, :string
    add_column :reports, :country2, :string
    add_column :reports, :city3, :string
    add_column :reports, :state3, :string
    add_column :reports, :country3, :string
    add_column :reports, :city4, :string
    add_column :reports, :state4, :string
    add_column :reports, :country4, :string
    add_column :reports, :city5, :string
    add_column :reports, :state5, :string
    add_column :reports, :country5, :string
  end
end
