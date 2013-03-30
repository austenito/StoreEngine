require 'spec_helper'

describe 'user authentication' do

  context 'when a user registers from the index page' do

    context 'registration is valid' do
      it 'redirects back to index page' do
        visit "/create_account"
        fill_in "first_name", with: "Alexander"
        fill_in "last_name", with: "McQueen"
        fill_in "Email", with: "test123@gmail.com"
        fill_in "Password", with: "password1"
        fill_in "Confirm password", with: "password1"

        click_button("Submit")
        expect(current_path).to eq root_path
      end

      it 'creates a new account'

    end

    context 'registration is invalid'
  end

end



