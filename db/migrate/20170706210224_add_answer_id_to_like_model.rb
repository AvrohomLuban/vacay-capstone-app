class AddAnswerIdToLikeModel < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :answer_id, :integer
  end
end
