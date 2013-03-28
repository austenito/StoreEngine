require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    context "an authorized user" do

      before do

        valid_attributes = {
          email: "email@email.com",
          password: "password",
          password_confirmation: "password"
        }

        user = User.create!(valid_attributes)

        post :create, {email: "email@email.com",
          password: "password"}

      end

      it "can log in" do
        expect(controller).to be_logged_in
      end

      it "redirects to the root url" do
        expect(response).to redirect_to root_path
      end
    end

    context "an unauthorized user" do

      before do
        post :create, {email: "email@email.com",
          password: "password"}
      end

      it "cannot log in" do
        expect(controller).to_not be_logged_in
      end

      it "renders the login template" do
        expect(response).to render_template :login_form
      end
    end
  end

  describe "GET 'destroy'" do

    context "a user is logged in" do
      before do

        valid_attributes = {
          email: "email@email.com",
          password: "password",
          password_confirmation: "password"
        }

        user = User.create!(valid_attributes)

        login_user(user)

      end

      it "logs out the user" do
        delete :destroy
        expect(controller).to_not be_logged_in
      end
    end
  end

end
