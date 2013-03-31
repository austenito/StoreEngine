class Order < ActiveRecord::Base

   attr_accessible :products, :quantity, :product_id, :user_id, :status

   validates :user_id, presence: true

   has_many :order_products
   has_many :products, through: :order_products
   belongs_to :user

   validate :has_products? 

   def has_products?
    errors.add :base, "Order must have at least one product" if self.products.blank?
   end 
end


