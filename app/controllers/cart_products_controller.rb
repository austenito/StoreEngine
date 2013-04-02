class CartProductsController < ApplicationController
  def update
    @cart_product = CartProduct.find(params[:id])
  end
end
