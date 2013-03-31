require 'spec_helper'

describe Order do
  let(:order) { Order.create(user_id: 1) }
  let(:product) { Product.create(name: "sample", description: "blah", price: 2.00) }

  before do 
    order.products << product
  end 

  context "validation" do

    it "has many products" do
      order.products << product
    end

    context "an order does not belong to a user" do

      before do
        order.user_id = nil 
      end 

      it "is invalid" do 
        expect(order).to be_invalid
      end 

      it "has errors" do 
        expect(order).to have(1).errors_on :user_id
      end  
    end 

    context "an order is not for one or more products" do 
      before do 
        order.products.clear
      end

      it "is invalid" do 
        expect(order).to be_invalid
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
