require 'spec_helper'

describe Admin::OrdersController do

  context "a real admin" do
    let(:product) do
     banana = Product.create(name: "banana", description: "yummy", price: 2.00)
      banana.image = File.open("public/images/001.jpg")
      banana.save
      banana
    end
    let(:order) { Order.new(quantity: 2, status: "shipped", user_id: 1) }

    before do
      user = User.create(
        email: "user@user.com",
        password: "blah",
        password_confirmation: "blah",
        admin: true,
        first_name: "first",
        last_name: "last",
        display_name: "display"
      )

      login_user(user)

      order.products << product
      order.save
    end

    context "an admin visits their order page" do

      it "renders all orders" do
        orders = Order.all
        get :index
        expect(assigns(:orders)).to match_array orders
      end

      it "shows total number of orders by status" do
        get :index
        expect(Order.find_all_by_status("shipped").count).to eq 1
      end

      it "cancells an order that is currently pending" do
        pending
        Product.create(name: "banana", description: "yummy", price: 2.00)
        order = Order.create(product_id: 1, quantity: 2, status: "shipped", user_id: 1)
      end

      it "returns the products associated with an order" do
        get :show, {id: 1}
        expect(assigns(:order).products.first.name).to eq product.name
      end
    end

    context "an admin clicks to update an order" do

      it "cancels a pending order" do
        order.status = "cancelled"
        post :cancel, { id: order.id }
        expect(assigns(:order).status).to eq "cancelled"
      end

      it "marks as returned orders that are currently marked as shipped" do
        order.status = "shipped"
        post :return, { id: order.id }
        expect(assigns(:order).status).to eq "returned"
      end

      it "marks as paid orders that are currently pending" do
        order.status = "pending"
        post :paid, { id: order.id }
        expect(assigns(:order).status).to eq "paid"
      end

    context "when an admin wants to ship the mutherfucker"

      it "marks as shipped orders that are currently paid" do
        order.status = "paid"
        post :ship, { id: order.id }
        # CheckoutMailer.stub(:order_fulfillment).and_return(true)

        expect(assigns(:order).status).to eq "shipped"
      end

      it "sends an email to the customer with images attached" do
        post :ship, { id: order.id }
        expect(ActionMailer::Base.deliveries.first.attachments.first.filename).to eq "001.jpg"
      end
    end

    context "an admin clicks to view orders by status" do

      it "filters orders by shipped status" do
        shipped_orders = Order.find_all_by_status("shipped")
        get :index, { status: "shipped"}
        expect(assigns(:orders)).to eq shipped_orders
      end

      it "filters all cancelled orders" do
        order.status = "cancelled"
        other_order = Order.new(quantity: 2, status: "shipped", user_id: 1)
        other_order.products << product
        order.save
        cancelled_orders = Order.find_all_by_status("cancelled")
        get :index, { status: "cancelled"}
        expect(assigns(:orders)).to eq cancelled_orders
      end
    end
  end

  context "non admin users" do

    context "logged in users" do

      before do

        user = User.create(
          email: "user@user.com",
          password: "blah",
          password_confirmation: "blah",
          admin: false,
          first_name: "first",
          last_name: "last",
          display_name: "display"
        )

        login_user(user)
      end

      it "cannot go to the admin orders page" do
        get :index
        expect(response).to redirect_to login_path
      end

      it "cannot go to the show page of an order" do
        get :show, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot cancel" do
        post :cancel, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot return a product" do
        post :return, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot edit that product" do
        post :update_quantity, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot mark a product as shipped" do
        post :ship, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot edit a order" do
        get :edit, id: 1
        expect(response).to redirect_to login_path
      end

    end

    context "not logged in users" do
      it "cannot go to the admin orders page" do
        get :index
        expect(response).to redirect_to login_path
      end

      it "cannot go to the show page of an order" do
        get :show, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot cancel" do
        post :cancel, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot return a product" do
        post :return, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot edit that product" do
        post :update_quantity, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot mark a product as shipped" do
        post :ship, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot edit a order" do
        get :edit, id: 1
        expect(response).to redirect_to login_path
      end
    end
  end
end



