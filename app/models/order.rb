class Order < ActiveRecord::Base
   attr_accessible :products, :quantity, :product_id, :status

   has_many :order_products
   has_many :products, through: :order_products

end
