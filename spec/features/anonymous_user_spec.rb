require 'spec_helper'

describe "An unathorized user" do

  describe "does stuff they're not supposed to do" do
    it "and is sent to a 403 page"
  end

  describe "goes to a product's page" do

    it "and sees product info."

    context "of an active product" do
      it "and sees a 'buy' button."

      context "and clicks on the 'buy' button" do
        it "and sees a message that the item was added to their cart"
      end
    end

    context "of a retired prodcut" do
      it "and sees the word 'retired'."
    end
  end

  describe "signs up for an account" do

    context "with invalid information" do
      it "stays on the same page and highlights the invalid fields"
    end

    context "with valid information" do
      it "and is logged in and directed back to their original page"
    end

    context "with an email that already exists in the db" do
      it "and gets a message that an account already exists"
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
