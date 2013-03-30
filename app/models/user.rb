class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :admin, :password_confirmation, :first_name, :last_name
  validates :email, :password, presence: true

  validates_confirmation_of :password, message: "should match confirmation"
  validates_length_of :password, minimum: 4, message: "password must be at least 4 characters long"
  has_many :orders
end
