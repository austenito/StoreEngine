require 'spec_helper'

describe Admin::CategoriesController do

  describe 'create category' do
    context 'admin wants to create a new category' do
      it 'creates a new category' do
        post :create, {name: 'shoes'}
        expect(Category.last.name).to eq 'shoes'
      end
    end
  end

  describe 'modify category' do
    context 'admin wants to modify existing category' do
      it 'modifies the category' do
        #visit category edit page
        #modify name
        #submit
        #expect new name to be correct
      end
    end
  end

  describe 'retire category' do
    context 'admin wants to retire category' do
      it 'retires the category' do
        #do we want to bother with this? not required in spec
      end
    end
  end

end
