class Order < ActiveRecord::Base

   attr_accessible :products, :user_id, :status

   validates :user_id, presence: true
   
   has_many :order_products
   has_many :products, through: :order_products
   belongs_to :user

   validate :has_products? 

   def has_products?
    errors.add :base, "Order must have at least one product" if self.products.blank?
   end 

   def total
    total = 0
    self.order_products.each do |order_product|
      total += order_product.quantity * Product.find_by_id(order_product.product_id).price 
    end 
    total
   end 
end


