class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :retired, :image
  validates :name, :description, :price, presence: true
  validates_attachment :image, :content_type {content_type: "image/jpg"}

  has_many :cart_products
  has_many :carts, through: :cart_products
  has_attached_file :image, styles: { medium: "300x300", thumb:"100x100"}

  def retired?
    retired
  end
end
