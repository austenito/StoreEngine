class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :admin, :password_confirmation, :first_name, :last_name, :display_name
  attr_accessible :credit_card_number, :security_code, :address_line1, :city, :state,:zipcode
  validates :email, :password, :first_name, :last_name, presence: true

  validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }

  validates_confirmation_of :password, message: "should match confirmation"
  validates_length_of :password, minimum: 4, message: "password must be at least 4 characters long"

  validates_length_of :display_name, minimum: 2, maximum: 32, :allow_blank => true, message: "Display Name must be between 2 and 32 characters in length" 

  has_many :orders

end

