class AddForumIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :forum_id, :integer
  end
end
