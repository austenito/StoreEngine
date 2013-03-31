require 'spec_helper'

describe Admin::CategoriesController do

  describe 'create category' do
    context 'admin wants to create a new category' do
      it 'creates a new category' do
        post :create, {category: { name: 'shoes'} }
        expect(Category.last.name).to eq 'shoes'
      end
    end
  end
end
