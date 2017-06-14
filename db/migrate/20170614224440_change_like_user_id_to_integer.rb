class ChangeLikeUserIdToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :user_id, :integer, using: 'user_id::integer'
  end
end
