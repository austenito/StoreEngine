require 'spec_helper'

describe Product do

  let(:product) { Product.new }

  context "when missing a name" do
    it "is invalid" do
      expect(product).to be_invalid
    end

    it "has errors" do
      expect(product).to have(1).errors_on :name
    end
  end

  context "when missing a description" do
    it "is invalid" do
      expect(product).to be_invalid
    end

    it "has errors" do
      expect(product).to have(1).errors_on :description
    end
  end

  context "when missing a price" do
    it "is invalid" do
      expect(product).to be_invalid
    end

    it "has errors" do
      expect(product).to have(1).errors_on :price
    end
  end

  context "when valid" do
    it "is valid" do
      product = Product.new(:name => "sample", :description => "blah blah", :price => 24.99)
      expect(product).to be_valid
    end
  end

end
