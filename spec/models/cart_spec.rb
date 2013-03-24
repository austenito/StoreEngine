require 'spec_helper'

describe Cart do
  context "adding an item to the cart" do
    context "when quantity isn't specified" do
      it "sets the quantity to be 1" do
        cart = Cart.create
        p = Product.create(name: "sample", description: "sample product", price: 2.00)

        cart.products << p

        expect(cart.cart_products.find_by_product_id(p.id).quantity).to eq 1
      end
    end
  end
end
