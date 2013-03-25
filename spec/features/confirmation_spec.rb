require 'spec_helper'

describe 'confirmation' do 

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

  describe 'user receipt' do 
    # it "has the user's purchase information" do
    #   order_1 = Order.create(product: product, quantity: 1)
    #   visit confirmation_checkout_path
    #   page.driver.post("#{confirmation_checkout_path}?creditCardNumber=4242424242424242")
    #   page.should have_content(product.name)
    #   page.should have_content(product.description)
    #   page.should have_content(product.price * order_1.quantity)
    # end 
  end 
end 
