class RemoveTimestampsCategoriesProducts < ActiveRecord::Migration
  def change
    remove_column :categories_products, :created_at
    remove_column :categories_products, :updated_at
  end
end
