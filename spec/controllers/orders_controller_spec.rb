require 'spec_helper'

describe OrdersController do
  context 'GET#index' do
    it 'populates an array with users orders' do
      user = User.create(email: 'd@d.com', password: '1234', password_confirmation: '1234')
      login_user(user)
      orders = []
      orders << Order.create(user_id: 1)
      orders << Order.create(user_id: 1)
      Order.create(user_id: 2)
      get :index
      expect(assigns(:orders)).to match_array orders

    end
  end
end
