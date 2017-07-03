class AddReportIdAndWebUrlToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :weburl, :string
    add_column :photos, :report_id, :integer
  end
end
