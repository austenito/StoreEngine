require 'spec_helper'

describe "category pages" do

  describe "creating a category" do
    before { visit new_category_path }

    context "when information is valid" do
      it "creates a new category" do
        fill_in "Name", with: "eBooks"
        expect{ click_button "Create Category" }.to change(Category, :count).by(1)
      end
    end

  end




end
