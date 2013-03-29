class RenameCategoryProductsToCategoriesProducts < ActiveRecord::Migration
  def change
    rename_table :category_products, :categories_products
  end
end
