# require 'spec_helper'

# describe "An unathorized user" do

#   describe "does stuff they're not supposed to do" do

#     it "and is sent to a 403 page"
#   end

#   describe "goes to a product's page" do

#     let!(:product) do
#       Product.create!(
#         name: "Sample Product",
#         description: "This is the product description",
#         price: 2.00
#       )
#     end

#     let!(:retired_product) do
#       Product.create!(
#         name: "Sample Product",
#         description: "This is the product description",
#         price: 2.00,
#         retired: true
#       )
#     end

#     before do

#       visit root_path
#       click_link(product.name)
#     end

#     it "and sees product info" do

#       expect(page).to have_css("img.product")
#       expect(page).to have_content product.name
#       expect(page).to have_content product.description
#       expect(page).to have_content product.price
#     end

#     context "of an active product" do

#       context "and clicks on the 'buy' button" do

#         before do

#           visit root_path
#           click_link(product.name)
#           find('.purchase_button').click
#         end

#         it "and sees a message that the item was added to their cart" do

#           expect(page).to have_content 'added'
#         end
#       end
#     end

#     context "of a retired prodcut" do

#       it "and sees the word 'retired'." do
#         visit product_path(retired_product)

#         expect(page).to have_content 'Retired'
#         expect(page).to_not have_selector 'button'
#       end
#     end
#   end

#   describe "signs up for an account" do

#     let(:create_account_button) {"Create Account"}

#     before do

#       visit root_path
#       click_link("Create account")
#     end

#     context "with invalid information" do

#       it "stays on the same page and highlights the invalid fields" do
#         click_button(create_account_button)

#         expect(page).to have_content('error')
#         expect(page).to have_selector('input.invalid', name: 'user[first_name]')
#         expect(page).to have_selector('input.invalid', name: 'user[last_name]')
#         expect(page).to have_selector('input.invalid', name: 'user[email]')
#         expect(page).to have_selector('input.invalid', name: 'user[password]')
#         expect(page).to have_selector('input.invalid', name: 'user[password_confirmation]')
#       end
#     end

#     context "with valid information" do

#       it "and is logged in" do
#         new_user_info = {
#           first_name: "George",
#           last_name: "Smith",
#           email: "email@email.com",
#           password: "my_password"
#         }

#         fill_in("First Name", with: new_user_info[:first_name])
#         fill_in("Last Name", with: new_user_info[:last_name])
#         fill_in("Email", with: new_user_info[:email])
#         fill_in("Password", with: new_user_info[:password])
#         fill_in("Confirm Password", with: new_user_info[:password])
#         click_button(create_account_button)

#         expect(page).to have_selector("a", content: "Log out")
#       end
#     end

#     context "with an email that already exists in the db" do

#       let(:user_info) do
#         { first_name: "George",
#           last_name: "Smith",
#           email: "email@email.com",
#           password: "my_password" }
#       end

#       before do
#         User.create!(user_info)
#       end

#       it "and gets a message that an account already exists" do

#         fill_in("First Name", with: user_info[:first_name])
#         fill_in("Last Name", with: user_info[:last_name])
#         fill_in("Email", with: user_info[:email])
#         fill_in("Password", with: user_info[:password])
#         fill_in("Confirm Password", with: user_info[:password])
#         click_button(create_account_button)

#         expect(page).to have_content("exists")
#       end
#     end
#   end

#   describe "logs in" do

#     let(:login_button) { ".login" }

#     let(:user_info) do
#       { email: "email@email.com",
#         password: "password",
#         first_name: "First",
#         last_name: "Last" }
#     end

#     context "with user info that matches info in the db" do

#       before do
#         User.create!(user_info)
#         visit root_path
#       end

#       it "and is logged in and sees a messsage that they are logged in" do
#         within("header") do
#           click_link("Login")
#         end
#         fill_in "email", with: user_info[:email]
#         fill_in "password", with: user_info[:password]
#         find(login_button).click
#         expect(page).to have_content("Log out")
#       end
#     end

#     context "with user info that doesn't exist in the db" do

#       it "is not logged in and given a message that login info is not correct" do
#         click_link("Login")
#         fill_field("Email").with(user_info.email)
#         fill_field("Password").with(user_info.password)
#         click_button(login_button)
#         expect(page).to have_content("error")

#       end

#     end
#   end

#   describe "views their cart" do

#     context "and the cart is empty" do

#       it "and sees a message that the cart is empty" do
#         visit cart_path
#         expect(page).to have_content "empty"
#       end
#     end

#     context "and the cart has items" do

#       let(:product) do
#         Product.create!(
#           name: "Name!",
#           description: "Description!",
#           price: 1.00
#         )
#       end

#       let(:product2) do
#         Product.create!(
#           name: "Name2!",
#           description: "Description2!",
#           price: 2.00
#         )
#       end

#       let(:cart) do
#         cart = Cart.create!
#         cart.products << product
#         cart.products << product2
#         puts cart.cart_products.inspect
#         cart.save!
#         cart
#       end

#       let(:setup_cart) do
#         page.set_rack_session(cart_id: cart.id)
#         #session[:cart_id] = cart.id
#       end

#       before do
#         setup_cart
#         visit cart_path
#       end

#       it "and sees a table of their cart items which can be modified" do

#         cart.products.each do | product |
#           expect(page).to have_content(product.name)
#           expect(page).to have_content(product.price)
#           #expect(page).to have_selector('input', name: 'quantity', count: 1)
#           expect(find_field('quantity')).to have_value(1)
#           expect(page).to have_selector('button', value: 'Update')
#         end

#         within('tr[position=0]') do
#           fill_field('quantity').with(3)
#           click_button('Update')
#         end

#         expect(page).to have_content('success')

#         within('tr[position=0]') do
#           click_button('Remove', exact: false)
#         end

#         expect(page).to_not have_content(product.name)

#       end

#       context "and attempts to checkout" do

#         before do
#           click_button('Checkout', exact: false)
#         end

#         it "but is asked to first login or signup" do
#           expect(page).to have_content("Please login")
#         end

#       end
#     end

#   end

# end
