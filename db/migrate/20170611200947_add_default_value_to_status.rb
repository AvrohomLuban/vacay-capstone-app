class AddDefaultValueToStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :status, :string, :default => "Non-Elite Member"
  end
end
