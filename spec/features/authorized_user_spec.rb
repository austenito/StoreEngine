require 'spec_helper'

describe "An authorized user" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
  let(:user_info) do
    { email: "email@email.com",
      password: "password",
      first_name: "First",
      last_name: "Last" }
  end

  before do
   user = User.create!(user_info)
   login_user(user)
  end

<<<<<<< HEAD
=======
>>>>>>> described features for an authorized user
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
  describe "does stuff they're not supposed to do" do
    it "and is sent to a 403 page"
  end

  describe "goes to a product's page" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    let(:product) do
      Product.create!(
        name: "sample",
        description: "sample description",
        price: 2.00 )
    end

    before do

      visit product_path(product)
    end
<<<<<<< HEAD

    context "clicks on the 2-click order option" do

      before do
        click_button("Buy with 2-click")
      end

      it "adds the item to the cart and directed to the checkout page" do
        expect(current_path).to eq checkout_path
      end
=======
    it "sees a 2-click order option"

    context "clicks on the 2-click order option" do
      it "adds the item to the cart and directed to the checkout page"
>>>>>>> described features for an authorized user
=======

    context "clicks on the 2-click order option" do

      before do
        click_button("Buy with 2-click")
      end

      it "adds the item to the cart and directed to the checkout page" do
        expect(current_path).to eq checkout_path
      end
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    end
  end

  describe "checks out" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
      let(:product) do
        Product.create!(
          name: "Name!",
          description: "Description!",
          price: 1.00
        )
      end

      let(:product2) do
        Product.create!(
          name: "Name2!",
          description: "Description2!",
          price: 2.00
        )
      end

      let(:cart) do
        Cart.create
        cart.products << product
        cart.products << product2
        cart.save!
      end

      def create_cart
        session[:cart_id] = cart.id
      end

      before do
        create_cart
        visit cart_path
        click_link('checkout')
      end

<<<<<<< HEAD
    context "and fills in the billing information with valid info" do

      it "and gets a message that the billing info is incorrect" do
        click_button('Confirm')

        expect(page).to have_content('error')
        expect(page).to have_selector('input.invalid', name: 'billing_info[credit_card_number]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[security_code]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[address_line1]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[city]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[zipcode]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[state]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[city]')

      end
=======
    context "and fills in the billing information with valid info" do

      it "and gets a message that the billing info is incorrect"
>>>>>>> described features for an authorized user
=======
    context "and fills in the billing information with valid info" do

      it "and gets a message that the billing info is incorrect" do
        click_button('Confirm')

        expect(page).to have_content('error')
        expect(page).to have_selector('input.invalid', name: 'billing_info[credit_card_number]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[security_code]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[address_line1]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[city]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[zipcode]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[state]')
        expect(page).to have_selector('input.invalid', name: 'billing_info[city]')

      end
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    end

    context "and fills in the billing information correctly" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
      before do
        valid_billing_info = {
          credit_card_number: 4242424242424242,
          security_code: 123,
          address_line1: '8711 Victory Lane',
          address_line2: 'Apt 203',
          city: 'Denver',
          state: 'CO',
          zipcode: 80246
        }

        fill_field('input', name: 'billing_info[credit_card_number]').with(valid_billing_info.credit_cart_number)
        fill_field('input', name: 'billing_info[security_code]').with(valid_billing_info.security_code)
        fill_field('input', name: 'billing_info[address_line1]').with(valid_billing_info.address_line1)
        fill_field('input', name: 'billing_info[address_line2]').with(valid_billing_info.address_line2)
        fill_field('input', name: 'billing_info[city]').with(valid_billing_info.city)
        fill_field('input', name: 'billing_info[zipcode]').with(valid_billing_info.zipcode)
        fill_field('input', name: 'billing_info[state]').with(valid_billing_info.state)
        fill_field('input', name: 'billing_info[city]').with(valid_billing_info.city)

      end

<<<<<<< HEAD
      it "and sees the order confirmation page"
        click_button('Confirm')
        expect(current_path).to eq confirmation_checkout_path
=======
      it "and sees the order confirmation page"
>>>>>>> described features for an authorized user
=======
      it "and sees the order confirmation page"
        click_button('Confirm')
        expect(current_path).to eq confirmation_checkout_path
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    end
  end

  describe "looks at past orders" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    before do
      visit root_path
      click_link('Orders')
    end

<<<<<<< HEAD
    context "but hasn't ordered anything in the past" do

      it "and sees a 'no past orders'" do
        expect(page).to have_content("No Orders")
      end
=======
    context "but hasn't ordered anything in the past" do

      it "and sees a 'no past orders'"
>>>>>>> described features for an authorized user
=======
    context "but hasn't ordered anything in the past" do

      it "and sees a 'no past orders'" do
        expect(page).to have_content("No Orders")
      end
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    end

    context "and has ordered items in the past" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
      before do
        #TODO setup factory girl and create dummy orders and products
      end

<<<<<<< HEAD
=======
>>>>>>> described features for an authorized user
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
      context "and clicks on an entry in the table for specific order information" do

        it "and sees details about the order products and status"
      end
    end

  end

  describe "logs out" do

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
    before do
      visit root_path
      click_link('Log out')
    end

    it "and is directed to the home page and sees a message that they were logged out" do
      expect(session).to be_empty
      expect(current_path).to eq root_path
      expect(page).to have_content('Login')
    end
<<<<<<< HEAD
=======
    it "and is directed to the home page and sees a message that they were logged out"
>>>>>>> described features for an authorized user
=======
>>>>>>> filled out most of authorized user spec. should use factory girl to create dummy data
  end
end
