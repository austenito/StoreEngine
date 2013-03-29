class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :retired
  validates :name, :description, :price, presence: true

  has_many :cart_products
  has_many :carts, through: :cart_products

  def retired?
    retired
  end
end
