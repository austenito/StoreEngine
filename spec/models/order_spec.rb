require 'spec_helper'

describe Order do
  context "validation" do
    it "has many products" do
      order = Order.create
      product = Product.create(name: "sample", description: "blah", price: 2.00)
      order.products << product

    end

    context "an order does not belong to a user" do

      it "is invalid" do 
      end 

      it "has errors" do 
      end  
    end 

    it "is valid when it has a quantity of positive value" do
      pending
    end

    it "does not save an order that has an invalid status" do 
      pending
    end 
  end
end
