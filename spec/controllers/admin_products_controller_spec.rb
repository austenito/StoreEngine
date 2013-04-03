require 'spec_helper'

describe Admin::ProductsController do
  context "a real admin" do
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
    end

    context 'when a new produt button gets clicked by an admin' do
      it 'creates the new product' do
        post :create, { product: {name: 'goat', description: 'has beard', price: 1.99} }
        expect(Product.last.name).to eq 'goat'
      end
    end

    context 'when an edit product button gets submitted by an admin' do

      it "edits that product" do
        product = Product.create!(name: 'name', description: 'description', price: 34.99)
        post :update, { id: 1, product: { name: 'name', description: 'new product description', price: 34.99 } }
        expect(Product.find_by_id(product.id).description).to eq 'new product description'
      end
    end

    context "POST #retire" do
      it "retires the product" do
        product = Product.create!(name: 'name', description: 'description', price: 34.99)
        post :retire, id: product.id
        retired_product = Product.find(product.id)
        expect(retired_product).to be_retired
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

      it "cannot go to the admin products page" do
        get :index
        expect(response).to redirect_to login_path
      end

      it "can't get a new product" do
        get :new
        expect(response).to redirect_to login_path
      end

      it "cannot go to the admin show product page" do
        get :show, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot go to the admin show product page" do
        get :edit, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot create a new product" do
        post :create, { product: {name: 'goat', description: 'has beard', price: 1.99} }
        expect(response).to redirect_to login_path
      end

      it "cannot retire the product" do
        post :retire, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot edit that product" do
        post :update, id: 1
        expect(response).to redirect_to login_path
      end

    end

    context "logged in users" do
      it "cannot go to the admin products page" do
        get :index
        expect(response).to redirect_to login_path
      end

      it "can't get a new product" do
        get :new
        expect(response).to redirect_to login_path
      end

      it "cannot go to the admin show product page" do
        get :show, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot go to the admin show product page" do
        get :edit, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot create a new product" do
        post :create, { product: {name: 'goat', description: 'has beard', price: 1.99} }
        expect(response).to redirect_to login_path
      end

      it "cannot retire the product" do
        post :retire, id: 1
        expect(response).to redirect_to login_path
      end

      it "cannot edit that product" do
        post :update, id: 1
        expect(response).to redirect_to login_path
      end

    end
  end
end


