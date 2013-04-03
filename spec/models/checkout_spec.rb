require 'spec_helper'

describe Checkout do
    let(:billing_info ) do
      {credit_card_number: "4242424242424242",
      address_line1: "1062 Delaware Street",
      address_line2: "Suite 200",
      city: "Denver",
      state: "CO",
      zipcode: "80204",
      name: "John Doe"}

    end
  it "accepts valid billing info" do
    checkout = Checkout.new(billing_info)
    expect(checkout).to be_valid
  end

  context "invalid credit card" do

    it "does not validate invalid credit card numbers" do
      billing_info[:credit_card_number]= "2"

      checkout = Checkout.new billing_info
      expect(checkout).to_not be_valid
    end

    it "has errors when credit card " do
      billing_info[:credit_card_number]= "2"

      checkout = Checkout.new billing_info
      expect(checkout.errors).to match_array [CheckoutErrors.new(:credit_card_info)]
    end

    it "does not validate blank credit card number" do
      billing_info[:credit_card_number]= nil
      checkout = Checkout.new billing_info
      expect(checkout.errors).to match_array [CheckoutErrors.new(:credit_card_info)]
    end
  end

  context "invalid address line1" do
    let(:checkout) { Checkout.new billing_info }

    before do
      billing_info[:address_line1]= ""
    end

    it "is not valid" do
      expect(checkout).to_not be_valid
    end

    it "has errors" do
      expect(checkout.errors).to match_array [CheckoutErrors.new(:address_line1)]
    end

  end

  context "invalid state" do
    let(:checkout) { Checkout.new billing_info }

    before do
      billing_info[:state]= nil
    end

    it "is not valid" do
      expect(checkout).to_not be_valid
    end

    it "has errors" do
      expect(checkout.errors).to match_array [CheckoutErrors.new(:state)]
    end

  end

  context "invalid city" do

    let(:checkout) { Checkout.new billing_info }

    before do
      billing_info[:city]= nil
    end

    it "is not valid" do
      expect(checkout).to_not be_valid
    end

    it "has errors" do
      expect(checkout.errors).to match_array [CheckoutErrors.new(:city)]
    end
  end

  context "invalid name" do

    let(:checkout) { Checkout.new billing_info }

    before do
      billing_info[:name]= ""
    end

    it "is not valid" do
      expect(checkout).to_not be_valid
    end

    it "has errors" do
      expect(checkout.errors).to match_array [CheckoutErrors.new(:name)]
    end

  end

  context "invalid zipcode" do

    let(:checkout) { Checkout.new billing_info }

    before do
      billing_info[:zipcode]= ""
    end

    it "is not valid" do
      expect(checkout).to_not be_valid
    end

    it "has errors" do
      expect(checkout.errors).to match_array [CheckoutErrors.new(:zipcode)]
    end

  end
end

