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

    context "when information is invalid" do
      it "doesn't create a new category" do
        fill_in "Name", with: ""
        expect{ click_button "Create Category" }.to_not change(Category, :count).by(1)
      end
    end
  end

  describe "modifying a category" do
    let!(:category){Category.create!(name: "shoes")}
    before { visit '/categories/1/edit' }

    it "modifies the category name" do

      fill_in "name", with: "dogs"
      click_button "Submit"
      expect(page).to have_content "dogs"
    end

  end


end
