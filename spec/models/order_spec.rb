require 'spec_helper'

describe Order do
  context "validation" do
    it "has many products" do
      order = Order.create
      product = Product.create
      order.products << product

    end

    it "is valid when it has a quantity of positive value" do
    end

  end

end
