require 'spec_helper'

describe "An unathorized user" do

  describe "does stuff they're not supposed to do" do

    it "and is sent to a 403 page"
  end

  describe "goes to a product's page" do

    let(:product) do
      Product.create(
        name: "Sample Product",
        description: "This is the product description",
        price: 2.00
      )
    end

    before do

      visit product_path(product)
    end

    it "and sees product info" do

      find('img.product')
      expect(page).to have_content product.name
      expect(page).to have_content product.description
      expect(page).to have_content product.price
    end

    context "of an active product" do

      it "and sees a 'buy' button." do

        within('.product-details') do

          find('.purchase_button')
        end

      end

      context "and clicks on the 'buy' button" do

        before do

          find_button('.purchase_button').click
        end

        it "and sees a message that the item was added to their cart" do

          expect(page).to have_content 'added'
        end
      end
    end

    context "of a retired prodcut" do

      it "and sees the word 'retired'." do

        expect(page).to have_content 'Retired'
        expect(page).to_not have_selector 'button'
      end
    end
  end

  describe "signs up for an account" do

    let(:create_account_button) {"Create Account"}

    before do

      visit root_path
      click_link("Create account")
    end

    context "with invalid information" do

      it "stays on the same page and highlights the invalid fields" do
        click_button(create_account_button)

        expect(page).to have_content('error')
        expect(page).to have_selector('input.invalid', name: 'user[first_name]')
        expect(page).to have_selector('input.invalid', name: 'user[last_name]')
        expect(page).to have_selector('input.invalid', name: 'user[email]')
        expect(page).to have_selector('input.invalid', name: 'user[password]')
        expect(page).to have_selector('input.invalid', name: 'user[password_confirmation]')
      end
    end

    context "with valid information" do

      it "and is logged in" do
        new_user_info = {
          first_name: "George",
          last_name: "Smith",
          email: "email@email.com",
          password: "my_password"
        }

        fill_in("First Name", with: new_user_info.first_name)
        fill_in("Last Name", with: new_user_info.last_name)
        fill_in("Email", with: new_user_info.email)
        fill_in("Password", with: new_user_info.password)
        fill_in("Confirm Password", with: new_user_info.password)
        click_button(create_account_button)

        expect(page).to have_selector("a", content: "Log out")
      end
    end

    context "with an email that already exists in the db" do

      let(:user_info) do
        { first_name: "George",
          last_name: "Smith",
          email: "email@email.com",
          password: "my_password" }
      end

      before do
        User.create!(user_info)
      end

      it "and gets a message that an account already exists"


        fill_in("First Name", with: new_user_info.first_name)
        fill_in("Last Name", with: new_user_info.last_name)
        fill_in("Email", with: new_user_info.email)
        fill_in("Password", with: new_user_info.password)
        fill_in("Confirm Password", with: new_user_info.password)
        click_button(create_account_button)

        expect(page).to have_selector("a", content: "Log out")
    end
  end

  describe "logs in" do

    context "with user info that matches info in the db" do
      it "and is logged in and sees a messsage that they are logged in"
    end

    context "with user info that doesn't exist in the db" do
      it "is not logged in and given a message that login info is not correct"
    end
  end

  describe "views their cart" do

    context "and the cart is empty" do

      it "and sees a message that the cart is empty"
    end

    context "and the cart has items" do

      it "and sees a table of their cart items which can be modified"

      context "and attempts to checkout" do

        it "but is asked to first login or signup"

      end
    end

  end

end
