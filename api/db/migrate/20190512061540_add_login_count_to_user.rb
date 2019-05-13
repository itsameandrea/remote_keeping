class AddLoginCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_count, :integer, default: 0, nil: 0
  end
end
