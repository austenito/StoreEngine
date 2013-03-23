class Order < ActiveRecord::Base
   attr_accessible :product, :quantity
   has_one :product
end
