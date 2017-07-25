class AddAboutAuthorToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :about_author, :text
  end
end
