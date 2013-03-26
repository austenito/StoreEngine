require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    it "creates a new user" do
      get :new
      expect(assigns(:user)).to be_kind_of(User)
    end
  end

end
