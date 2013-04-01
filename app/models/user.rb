class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :admin, :password_confirmation, :first_name, :last_name, :display_name
  validates :email, :password, :first_name, :last_name, presence: true

  validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }

  validates_confirmation_of :password, message: "should match confirmation"
  validates_length_of :password, minimum: 4, message: "password must be at least 4 characters long"
  has_many :orders
end


