class AddUserIdtotitle < ActiveRecord::Migration[5.0]
  def change
    add_column :forums, :user_id, :integer
  end
end
