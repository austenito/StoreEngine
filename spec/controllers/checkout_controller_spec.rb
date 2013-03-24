require 'spec_helper'

describe CheckoutController do

  describe "when a user clicks checkout" do 

    let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

    context "when the user information is not valid" do

      it "does not create an order with invalid credit card info" do 
        post :confirm, {creditCardNumber: "blahbadnumber"}
        expect(response).to redirect_to ('/checkout')
      end

      it "does not create an order with invalid email"

      it "does not crate an order with 0 or less"

      it "redirects to checkout with an error message " do 
        pending
      end 
    end 

    context "when the user information is valid" do 

      it "then creates a new order" do 
        pending
        expect(Order.count).to eq 1
      end

      it "redirects to checkout confirmation page" do 
        pending
      end
    end
  end
end
