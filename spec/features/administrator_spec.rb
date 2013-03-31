require 'spec_helper'

describe "An administrator" do

  describe "does stuff they're not supposed to do" do
    it "and is sent to a 403 page"
  end

  describe "modifies a product" do

    context "and gives valid product information" do

      it "and is directed to the product page"
    end

    context "and gives invalid product information" do

      it "and the invalid fields are highlighted"
    end
  end

  describe "adds a new product" do

    context "and gives valid product information" do

      it "and is directed to the product page"
    end

    context "and gives invalid product information" do

      it "and the invalid fields are highlighted"
    end

  end

  describe "adds a category" do

    context "that already exists" do

      it "and sees a notification that the category already exists"
    end

    context "that doesn't exist" do

      it "and sees a notification that the category was added"
    end
  end

  describe "looks at individual order information" do

    it "and sees order information"

    context "and modifies order information" do

      it "and gets a notification that the order was updated"
    end

  end

  describe "looks at the orders dashboard" do

    context "and cancels a pending order" do

      it "and get a notification confirming the change"
      it "and the order is removed from the pending orders table"
      it "and the order is moved to the canceled orders table"
    end

    context "and marks a shipped order as 'returned'" do

      it "and get a notification confirming the change"
      it "and the order is removed from the shipped orders table"
      it "and the order is moved to the returned orders table"
    end

    context "and marks a paid order as 'shipped'" do

      it "and get a notification confirming the change"
      it "and the order is removed from the paid orders table"
      it "and the order is moved to the shipped orders table"
    end

  end

end
