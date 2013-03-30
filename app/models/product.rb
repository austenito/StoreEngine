class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :retired, :image
  validates :name, :description, :price, presence: true

  has_many :cart_products
  has_many :carts, through: :cart_products
  has_and_belongs_to_many :categories
  has_attached_file :image, styles: { medium: "300x300", thumb:"100x100"}

  def retired?
    retired
  end
end
