class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price

  has_many :cart_products
  has_many :carts, through: :cart_products
end
