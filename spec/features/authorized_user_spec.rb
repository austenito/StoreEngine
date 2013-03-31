require 'spec_helper'

describe "An authorized user" do

  describe "does stuff they're not supposed to do" do
    it "and is sent to a 403 page"
  end

  describe "goes to a product's page" do

    it "sees a 2-click order option"

    context "clicks on the 2-click order option" do
      it "adds the item to the cart and directed to the checkout page"
    end
  end

  describe "checks out" do

    context "and fills in the billing information with valid info" do

      it "and gets a message that the billing info is incorrect"
    end

    context "and fills in the billing information correctly" do

      it "and sees the order confirmation page"
    end
  end

  describe "looks at past orders" do

    context "but hasn't ordered anything in the past" do

      it "and sees a 'no past orders'"
    end

    context "and has ordered items in the past" do

      context "and clicks on an entry in the table for specific order information" do

        it "and sees details about the order products and status"
      end
    end

  end

  describe "logs out" do

    it "and is directed to the home page and sees a message that they were logged out"
  end
end
