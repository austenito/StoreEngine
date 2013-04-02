class Cart < ActiveRecord::Base
  attr_accessible :cart_id 
  
  has_many :cart_products
  has_many :products, through: :cart_products

  # TODO: test this thing
  def empty?
    cart_products.count > 0
  end

  # TODO: test this thing
  def present?
    !empty?
  end
 
end
