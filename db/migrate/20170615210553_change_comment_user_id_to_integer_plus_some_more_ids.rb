class ChangeCommentUserIdToIntegerPlusSomeMoreIds < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :user_id, :integer, using: 'user_id::integer'
    change_column :destinations, :tip_id, :integer, using: 'tip_id::integer'
  end
end
