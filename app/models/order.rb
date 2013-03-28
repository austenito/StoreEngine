class Order < ActiveRecord::Base

   attr_accessible :products, :quantity, :product_id, :user_id, :status

   has_many :order_products
   has_many :products, through: :order_products
   belongs_to :user
end
