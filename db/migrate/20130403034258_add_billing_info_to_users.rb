class AddBillingInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit_card_number, :string
    add_column :users, :security_code, :string
    add_column :users, :address_line1, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
  end
end



