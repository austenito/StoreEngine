require 'spec_helper'

describe Product do

  describe "when a product is missing attributes" do 

    let(:product) { Product.new }

    context "when missing a name" do
      it "is invalid" do
        expect(product).to be_invalid
      end

      it "has errors" do
        expect(product).to have(1).errors_on :name
      end
    end

    context "when name is an empty string" do 
      it "is invalid" do 
        product.name = ""
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
  end

  describe "when a product has invalid attributes" do 

    let(:product) { Product.new(name: "grapes", description: "good", price: 3.00) }

    context "when its name is not unique" do
      it "is invalid" do 
        Product.create(name: "grapes", description: "sweet", price: 2.00)
        expect(product).to be_invalid
      end

      it "has errors" do 
      end 
    end 

    context "when description is an empty string" do 
      it "is invalid" do 
      end 

      it "has errors" do 
      end 
    end 

    context "when price is not a valid decimal numeric value" do 
      it "is invalid" do 
      end 

      it "has errors" do 
      end 
    end 

    context "when price is not greater than zero" do 
      it "is invalid" do 
      end 

      it "has errors" do 
      end 
    end

    context "when a photo is not a valid URL format" do 
      it "is invalid" do 
      end 

      it "has errors" do 
      end 
    end 
  end

  context "when valid" do
    it "is valid" do
      product = Product.new(:name => "sample", :description => "blah blah", :price => 24.99)
      expect(product).to be_valid
    end
  end
end
