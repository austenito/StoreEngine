class RemoveProductIdFromUsers < ActiveRecord::Migration
  def change 
    remove_column :users, :product_id
  end 
end
