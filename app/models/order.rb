class Order < ActiveRecord::Base
   attr_accessible :product, :quantity, :product_id
   has_one :product
end
