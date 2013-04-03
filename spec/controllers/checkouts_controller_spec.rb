require 'spec_helper'

describe CheckoutsController do

  describe "when a user clicks checkout" do

    let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2.00)}

    before do
      user = User.create!(first_name: "afirstname", last_name: "alastname", email: "email@email.com", password:"1234", password_confirmation:"1234")
      login_user(user)
      cart = Cart.create
      cart.products << product
      cart_product = cart.cart_products.find_by_product_id(product.id)
      cart_product.quantity = 3
      cart_product.save!
      cart.save!
      session[:cart_id] = cart.id
      session[:current_user_id] = user.id
    end

    context "when the billing information is not valid" do

      it "does not create an order with invalid credit card info" do

        expect {
          post :create, {creditCardNumber: "123"}
        }.to change(Order, :count).by(0)
      end

      it "does not create an order with invalid email"

      it "does not crate an order with 0 or less"

      it "redirects to checkout with an error message " do
        post :create, {creditCardNumber: "123"}
        expect(response).to redirect_to checkout_path
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
        post :create, valid_params
        expect(Order.count).to eq 1
      end

      it "adds the correct quantity of each product" do
        post :create, valid_params
        order = Order.first
        expect(order.order_products.find_by_product_id(product.id).quantity).to eq 3
      end

      #TODO describe what is valid information

      it "redirects to checkout confirmation page" do
        post :create, valid_params
        expect(response).to redirect_to confirmation_checkout_path
      end
    end

    context "when a user clicks the two-click buy option" do 

      context "when that user is not logged in" do 

        it "redirects to the login page" do 
        end 

        it "has a flash message that asks the user to first log in" do 
        end 
      end

      context "when that user is logged in" do 

        it "creates an order after the user confirms they want to buy that product" do 
        end 
      end  
    end 
  end
end
