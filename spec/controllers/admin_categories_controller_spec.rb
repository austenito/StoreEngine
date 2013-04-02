require 'spec_helper'

describe Admin::CategoriesController do

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

    describe 'create category' do
      context 'admin wants to create a new category' do
        it 'creates a new category' do
          post :create, {category: { name: 'shoes'} }
          expect(Category.last.name).to eq 'shoes'
        end
      end
    end
  end

  context "non admin user" do
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
    it "cannot go to the admin categories page" do
      get :index
      expect(response).to redirect_to login_path
    end

    it "cannot request a new category object " do
      get :new
      expect(response).to redirect_to login_path
    end

    it "cannot create a new category" do
      post :create, {category: { name: 'shoes'} }
      expect(response).to redirect_to login_path
    end

  end
  context "not logged in users" do
    it "cannot go to the admin categories page" do
      get :index
      expect(response).to redirect_to login_path
    end

    it "cannot request a new category object " do
      get :new
      expect(response).to redirect_to login_path
    end

    it "cannot create a new category" do
      post :create, {category: { name: 'shoes'} }
      expect(response).to redirect_to login_path
    end

  end
end
