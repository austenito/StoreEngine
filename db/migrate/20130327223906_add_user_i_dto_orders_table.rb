class AddUserIDtoOrdersTable < ActiveRecord::Migration
  def up
    add_column :orders, :user_id, :string
  end

  def down
    remove_column :orders, :user_id, :string
  end
end
