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
        expect(response).to redirect_to root_path
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

      it "redirects to checkout confirmation page" do
        post :create, valid_params
        expect(response).to redirect_to confirmation_checkout_path
      end
    end

  end

  describe "a guest clicks checkout" do
    it "should not be able to checkout" do
      get :show, id: 1
      expect(response).to redirect_to login_path
    end
  end

  describe "when a user clicks the two-click buy option" do 

    let!(:product){ Product.create!(name: "cool beans", description: "very cold beans", price: 2.00) }
    let!(:user) do  
      User.create!(first_name: "afirstname", 
        last_name: "alastname", 
        email: "email@email.com", 
        password:"1234", 
        password_confirmation:"1234",
        credit_card_number: "4242424242424242",
        address_line1: "1062 Delaware Street",
        city: "Denver",
        state: "CO",
        zipcode: "80204",) 
    end 



    context "when that user is not logged in" do 

      before do 
        post :create, { product_id: product.id }
      end

      it "redirects to the login page" do 
        expect(response).to redirect_to login_path
      end 

      it "has a flash message that asks the user to first log in" do 
        expect(flash.notice).to_not be_nil
      end 
    end


    context "when that user is logged in" do 

      context "when that user has billing info" do 
        before do 
          login_user(user)
          session[:current_user_id] = user.id
          post :two_click, { product_id: product.id }
        end 

        it "creates an order after the user confirms they want to buy that product" do 
          expect(Order.count).to eq 1
        end 
      end 

      context "when that user does not have billing info" do 

        before do 
          login_user(user)
          session[:current_user_id] = user.id
          post :two_click, { product_id: product.id }
        end 

        it "has a flash message that asks the user to fill out their billing info" do 
          expect(flash.notice).to_not be_nil
        end 
      end 
    end  
  end 
end
