class SetDefaultCartProductsQuantity < ActiveRecord::Migration
  
  def change
    change_column :cart_products, :quantity, :integer, default: 1
  end

end
