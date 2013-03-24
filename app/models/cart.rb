class Cart < ActiveRecord::Base
  attr_accessible :cart_id 
  
  has_many :cart_products
  has_many :products, through: :cart_products
 
end
