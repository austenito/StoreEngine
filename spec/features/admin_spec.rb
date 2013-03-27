require 'spec_helper'

describe "Admin abilties" do

  describe "login process" do

    context "given an admistrator" do

      context "enters valid email and password" do

        it "allows them to login" do
          admin = User.create!(email: "admin@admin.com",
                               password: "pass",
                               password_confirmation: "pass",
                               admin: true)

          visit new_user_session_path

          fill_in "email", with: admin.email
          fill_in "password", with: "pass"
          click_button "Log in!"

          expect(current_path).to eq "/dashboard"
        end
      end
    end
  end
end
