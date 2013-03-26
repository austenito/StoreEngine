class CartProduct < ActiveRecord::Base
   attr_accessible :cart_id, :product_id, :quantity
   validates :cart_id, :product_id, presence: true
   validates :quantity, :numericality => { :greater_than_or_equal_to => 1 }

   belongs_to :cart
   belongs_to :product
end
