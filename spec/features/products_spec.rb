require 'spec_helper'

describe 'browsing products' do
  it 'displays all products' do 
    Product.create!(name: 'Amazing eBook')
    visit '/'
    page.should have_content('Amazing eBook')
  end
end
