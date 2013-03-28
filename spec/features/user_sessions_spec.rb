require 'spec_helper'

describe 'user login' do

  let(:attempt_login) do
      visit login_path
      fill_in('email', with: "blah@blah.com")
      fill_in('password', with: "password")
      click_button("Log in!")
  end

  context "when a user tries to log in without an existing account" do


    it "tells the user to sign up and redirects to sign up page" do
      attempt_login
      current_path.should eq user_sessions_path
    end
  end

  context "when a user logs in with an existing account" do

    it "logs the user" do
      User.create!(email: "blah@blah.com",
                   password: "password",
                   password_confirmation: "password")

      attempt_login
      current_path.should eq root_path
    end
  end
end
