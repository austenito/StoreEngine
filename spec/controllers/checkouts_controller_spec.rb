require 'spec_helper'

describe CheckoutsController do

  describe "when a user clicks checkout" do

    let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

    context "when the user information is not valid" do

      it "does not create an order with invalid credit card info" do
        post :create, {creditCardNumber: "blahbadnumber"}
        expect(response).to redirect_to checkout_path
      end

      it "does not create an order with invalid email"

      it "does not crate an order with 0 or less"

      it "redirects to checkout with an error message " do
        pending
      end
    end

    context "when the order information is valid" do
      let(:valid_params) do {
          firstName: "bob",
          lastName: "Smith",
          creditCardNumber: "4916618311549608",
          expirationDate: "05/12",
          addressLine1: "1062 Delaware Street",
          addressLine2: "",
          city: "Denver",
          state: "CO",
          zipcode: "80204",
          email: "bob_smith@gmail.com",
          }
        end

      it "then creates a new order" do
        cart = Cart.create
        session[:cart_id] = cart.id
        post :create, valid_params
        expect(Order.count).to eq 1
      end

      #TODO describe what is valid information

      it "redirects to checkout confirmation page" do
        cart = Cart.create
        session[:cart_id] = cart.id
        post :create, valid_params
        expect(response).to redirect_to confirmation_checkout_path
      end
    end
  end
end
