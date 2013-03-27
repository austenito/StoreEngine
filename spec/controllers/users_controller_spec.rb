require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    it "initializes a new user" do
      get :new
      expect(assigns(:user)).to be_kind_of(User)
    end

    context "given valid sign up information" do

      let(:valid_attributes) do
        {user: {email: "user@user.com",
          password: "password1",
          password_confirmation: "password1"}}
      end

      it "creates a new user" do
        expect { post :create, valid_attributes }.to change(User, :count).by(1)
      end

      it "redirects to index" do
        post :create, valid_attributes
        expect(response).to redirect_to root_path
      end
    end

    context "given invalid sign up information" do
      let(:invalid_attributes ) do
        {user: {email: "user@user.com",
          password: "password1",
          password_confirmation: "pass"}}
        end

      it "doesn't create a new user" do
        expect { post :create, invalid_attributes }.to_not change(User, :count)
      end

      it "redirects to the sign up" do
        post :create, invalid_attributes
        expect(response).to render_template :new
      end

    end

  end

end
