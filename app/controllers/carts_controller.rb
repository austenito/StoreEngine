class CartsController < ApplicationController

  def add_item
     product = Product.find(params[:product_id])
    Cart.create.products << product
  end
end
