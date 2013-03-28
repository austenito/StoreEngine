class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :retired, :image
  validates :name, :description, :price, presence: true

  has_many :cart_products
  has_many :carts, through: :cart_products
<<<<<<< HEAD
  has_attached_file :image, styles: { medium: "300x300", thumb:"100x100"}

  def retired?
    retired
  end
=======
  has_and_belongs_to_many :categories
>>>>>>> add tests for updating products with categories
end
