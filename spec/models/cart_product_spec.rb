require 'spec_helper'

describe CartProduct do

  pending "add some examples to (or delete) #{__FILE__}"


  let!(:cart_product) { CartProduct.new }

  context "when quantity is less than 1" do
    it "is invalid" do
      cart_product.quantity = 0
      expect(cart_product).to be_invalid
    end

    it "has errors" do
      cart_product.quantity = 0
      expect(cart_product).to have(1).errors_on :quantity
    end
  end

  context "when missing a product_id" do
    it "is invalid" do
      expect(cart_product).to be_invalid
    end

    it "has errors" do
      cart_product.quantity = 0
      expect(cart_product).to have(1).errors_on :product_id
    end
  end

  context "when missing a cart_id" do
    it "is invalid" do
      expect(cart_product).to be_invalid
    end

    it "has errors" do
      cart_product.quantity = 0
      expect(cart_product).to have(1).errors_on :cart_id
    end
  end

  context "when valid" do
    it "is valid" do
      cart_product = CartProduct.new(:quantity => 7, :product_id => 12, :cart_id => 24)
      expect(cart_product).to be_valid
    end
  end
end
