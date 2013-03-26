require 'spec_helper'

describe 'user login' do

  context "when a user tries to log in without an existing account" do 

    it "tells the user to sign up and redirects to sign up page" do 
      pending
      visit '/login'
      # fill_in('userName', with: "bob_smith")
      # fill_in('password', with "password")
      # current_path.should eq login_path 
    end
  end 

  context "when a user logs in with an existing account" do 

    it "logs the user" do
      pending
      # visit '/login'
      # fill_in('userName', with: "bob_smith")
      # fill_in('password', with "password")
      # current_path.should eq login_path 
    end 
  end 
end 
