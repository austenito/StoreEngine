class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|

      t.timestamps
    end
  end
end
